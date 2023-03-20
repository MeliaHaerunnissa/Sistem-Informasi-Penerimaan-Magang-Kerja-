from flask import Flask, render_template, send_from_directory, jsonify, json, session, send_file, \
request, redirect, url_for
from datetime import datetime
from werkzeug.utils import secure_filename
from models_pendaftaran_magang import MPendaftaran_Magang
from models import MPengguna
from models_buat_akun import MSimpanUser
import pymysql
import time
import os

application = Flask(__name__)
application.config['UPLOAD_FOLDER'] = 'Magang BNN/static/uploads'
application.config['SECRET_KEY'] = '1234567890!@#$%^&*()'
application.config['MAX_CONTENT_PATH'] = 10000000

@application.route('/admin')
def admin():
	if 'username' in session:
		username = session['username']
		return render_template('data_pendaftaran.html', username=username)
	return redirect(url_for('login'))

@application.route('/login', methods=['GET','POST'])
def login():
	if request.method == 'POST':
		username = request.form['username']
		password = request.form['password']
		pengguna = MPengguna(username, password)
		if pengguna.authenticate():
			session['username'] = username
			return redirect(url_for('admin'))
		msg = 'Username/Password Salah.'
		return render_template('login.html', msg=msg)
	return render_template('login.html')

@application.route('/buat_akun', methods = ['GET', 'POST'])
def buat_akun():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        nama_lengkap = request.form['nama_lengkap']
        jenis_kelamin = request.form['jenis_kelamin']
        data = (username, password, nama_lengkap, jenis_kelamin)
        models = MSimpanUser()
        models.insertDB(data)
        return redirect(url_for('login'))
    else:
        return render_template('buat_akun.html')

@application.route('/logout')
def logout():
    session.pop('username', '')
    return redirect(url_for('admin'))

@application.route('/')
def home():
	return render_template('home.html')

@application.route('/data_pendaftaran')
def data_pendaftaran():
	models = MPendaftaran_Magang()
	container = []
	container = models.selectDB()
	return render_template('data_mahasiswa.html',container=container)

@application.route('/data_mahasiswa')
def data_mahasiswa():
	models = MPendaftaran_Magang()
	container = []
	container = models.data_mahasiswaDB()
	return render_template('pengumuman.html',container=container)

@application.route('/mahasiswa')
def mahasiswa():
	models = MPendaftaran_Magang()
	container = []
	container = models.mahasiswa_diterimaDB()
	return render_template('mahasiswa_diterima.html',container=container)

@application.route('/mahasiswa_penelitian')
def mahasiswa_penelitian():
	models = MPendaftaran_Magang()
	container = []
	container = models.mahasiswa_penelitianDB()
	return render_template('penelitian.html',container=container)

@application.route('/mahasiswa_pkl')
def mahasiswa_pkl():
	models = MPendaftaran_Magang()
	container = []
	container = models.mahasiswa_pklDB()
	return render_template('pkl.html',container=container)

@application.route('/mahasiswa_magang')
def mahasiswa_magang():
	models = MPendaftaran_Magang()
	container = []
	container = models.mahasiswa_magangDB()
	return render_template('magang.html',container=container)

@application.route('/mahasiswa_lainnya')
def mahasiswa_lainnya():
	models = MPendaftaran_Magang()
	container = []
	container = models.mahasiswa_lainnyaDB()
	return render_template('lainnya.html',container=container)

@application.route('/pendaftaran_magang', methods=['GET', 'POST'])
def pendaftaran_magang():
	if request.method == 'POST':
		foto = request.files['foto']
		foto.save(os.path.join(application.config['UPLOAD_FOLDER'], (foto.filename)))
		nama_lengkap = request.form['nama_lengkap']
		nim = request.form['nim']
		program_studi = request.form['program_studi']
		universitas = request.form['universitas']
		tujuan_magang = request.form['tujuan_magang']
		alamat_ktp = request.form['alamat_ktp']
		alamat_kost = request.form['alamat_kost']
		tanggal_masuk = datetime.now()
		tanggal_selesai = request.form['tanggal_selesai']
		email = request.form['email']
		no_telp = request.form['no_telp']
		riwayat_sehat = request.form['riwayat_sehat']
		status = request.form['status']
		file = request.files['file']
		file.save(os.path.join(application.config['UPLOAD_FOLDER'], (file.filename)))
		proposal = request.files['proposal']
		proposal.save(os.path.join(application.config['UPLOAD_FOLDER'], (proposal.filename)))
		data = (secure_filename(foto.filename), nama_lengkap, nim, program_studi, universitas, tujuan_magang, alamat_ktp, alamat_kost, tanggal_masuk, tanggal_selesai, email, no_telp, riwayat_sehat, status, secure_filename(file.filename), secure_filename(proposal.filename))
		models = MPendaftaran_Magang()
		models.insertDB(data)
		return redirect(url_for('pendaftaran_magang'))
	else:
		return render_template('insert_pendaftaran_magang.html')

@application.route('/update/<no>')
def update(no):
	models = MPendaftaran_Magang()
	data = models.getDBbyNo(no)
	return render_template('update_pendaftaran_magang.html', data= data)

@application.route('/update_prosess', methods=['GET', 'POST'])
def update_prosess():
	no = request.form['no']
	nama_lengkap = request.form['nama_lengkap']
	nim = request.form['nim']
	program_studi = request.form['program_studi']
	universitas = request.form['universitas']
	tanggal_masuk = request.form['tanggal_masuk']
	tanggal_selesai = request.form['tanggal_selesai']
	no_telp = request.form['no_telp']
	status = request.form['status']
	data = (nama_lengkap, nim, program_studi, universitas, tanggal_masuk, tanggal_selesai, no_telp, status, no)
	models = MPendaftaran_Magang()
	models.updateDB(data)
	return redirect(url_for('data_pendaftaran'))

@application.route('/delete/<no>')
def delete(no):
	models = MPendaftaran_Magang()
	models.deleteDB(no)
	return redirect(url_for('data_pendaftaran'))

@application.route('/downloadfile/<filename>', methods = ['GET'])
def download_file():
	return	render_template('data_pendaftaran.html', baris=filename)

@application.route('/return-files/<filename>')
def return_files_tut(filename):
	UPLOAD_FOLDER = 'static/uploads/'
	file_path = UPLOAD_FOLDER + filename
	return send_file(file_path, as_attachment=True, attachment_filename='')

@application.route('/display_image/<filename>')
def display_image(filename):
	return redirect(url_for('Magang BNN/static/', filename='uploads/' + filename))

if __name__ == '__main__':
	application.run(debug=True)