import pymysql
import config

db = cursor = None

class MPendaftaran_Magang:
    def __init__ (self, no=None, foto=None, nama_lengkap=None, nim=None, program_studi=None, universitas=None, tujuan_magang=None, alamat_ktp=None, alamat_kost=None, tanggal_masuk=None, tanggal_selesai=None, email=None, no_telp=None, riwayat_sehat=None, nama_file=None,
        status=None):
        self.no = no
        self.foto = foto
        self.nama_lengkap = nama_lengkap
        self.nim = nim
        self.program_studi = program_studi
        self.universitas = universitas
        self.tujuan_magang = tujuan_magang
        self.alamat_ktp = alamat_ktp
        self.alamat_kost = alamat_kost
        self.tanggal_masuk = tanggal_masuk
        self.tanggal_selesai = tanggal_selesai
        self.email = email
        self.no_telp = no_telp
        self.riwayat_sehat = riwayat_sehat
        self.nama_file = nama_file
        self.status = status

    def openDB(self):
        global db, cursor
        db = pymysql.connect(
                config.DB_HOST,
                config.DB_USER,
                config.DB_PASSWORD,
                config.DB_NAME)
        cursor = db.cursor()

    def closeDB(self):
        global db, cursor
        db.close()

    def selectDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM pendaftaran_magang")
        container = []
        for  no, foto, nama_lengkap, nim, program_studi, universitas, tujuan_magang, alamat_ktp, alamat_kost, tanggal_masuk, tanggal_selesai, email, no_telp, riwayat_sehat, status, nama_file, proposal in cursor.fetchall():
            container.append((no, foto, nama_lengkap, nim, program_studi, universitas, tujuan_magang, alamat_ktp, alamat_kost, tanggal_masuk, tanggal_selesai, email, no_telp, riwayat_sehat, status, nama_file, proposal))
        self.closeDB()
        return container

    def insertDB(self, data):
        self.openDB()
        cursor.execute("INSERT INTO pendaftaran_magang (foto, nama_lengkap, nim, program_studi, universitas, tujuan_magang, alamat_ktp, alamat_kost, tanggal_masuk, tanggal_selesai, email, no_telp, riwayat_sehat, status, nama_file, proposal) VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" % data)
        db.commit()
        self.closeDB()

    def getDBbyNo(self, no):
        self.openDB()
        cursor.execute("SELECT * FROM pendaftaran_magang WHERE no='%s'" % no)
        data = cursor.fetchone()
        return data

    def updateDB(self, data):
        self.openDB()
        cursor.execute("UPDATE pendaftaran_magang SET nama_lengkap='%s', nim='%s', program_studi='%s', universitas='%s', tanggal_masuk='%s', tanggal_selesai='%s', no_telp='%s', status='%s' WHERE no=%s" % data)
        db.commit()
        self.closeDB()

    def deleteDB(self, no):
        self.openDB()
        cursor.execute("DELETE FROM pendaftaran_magang WHERE no=%s" % no)
        db.commit()
        self.closeDB()

    def data_mahasiswaDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM data_mahasiswa")
        container = []
        for  no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai, status  in cursor.fetchall():
            container.append((no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai, status))
        self.closeDB()
        return container

    def mahasiswa_diterimaDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM mahasiswa_diterima")
        container = []
        for  no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai, status in cursor.fetchall():
            container.append((no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai, status))
        self.closeDB()
        return container

    def mahasiswa_penelitianDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM mahasiswa_penelitian")
        container = []
        for  no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai in cursor.fetchall():
            container.append((no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai))
        self.closeDB()
        return container

    def mahasiswa_pklDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM mahasiswa_pkl")
        container = []
        for  no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai in cursor.fetchall():
            container.append((no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai))
        self.closeDB()
        return container

    def mahasiswa_magangDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM mahasiswa_magang")
        container = []
        for  no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai in cursor.fetchall():
            container.append((no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai))
        self.closeDB()
        return container

    def mahasiswa_lainnyaDB(self):
        self.openDB()
        cursor.execute("SELECT * FROM lainnya")
        container = []
        for  no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai in cursor.fetchall():
            container.append((no, foto, nama_mahasiswa, nim, program_studi, universitas, tujuan_magang, periode_masuk, periode_selesai))
        self.closeDB()
        return container