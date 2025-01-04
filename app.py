from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL
from werkzeug.security import check_password_hash, generate_password_hash

app = Flask(__name__)

# koneksi
app.secret_key = 'bebasapasaja'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'datauser'
mysql = MySQL(app)

# registrasi
@app.route('/registrasi', methods=('GET', 'POST'))
def registrasi():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        role = request.form['role']
        
        # cek username atau email
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM tb_users WHERE username=%s OR email=%s', (username, email))
        akun = cursor.fetchone()
        if akun is None:
            cursor.execute('INSERT INTO tb_users VALUES (NULL,%s, %s, %s, %s)', (username, email, generate_password_hash(password), role))
            mysql.connection.commit()
            flash('Registrasi Berhasil', 'success')
        else:
            flash('Username atau email sudah ada', 'danger')
    return render_template('registrasi.html')

# login
@app.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM tb_users WHERE email=%s', (email,))
        akun = cursor.fetchone()
        if akun is None:
            flash('Login Gagal, Cek Username Anda', 'danger')
        elif not check_password_hash(akun[3], password):
            flash('Login Gagal, Cek Password Anda', 'danger')
        else:
            session['loggedin'] = True
            session['username'] = akun[1]
            session['role'] = akun[4]
            return redirect(url_for('index'))
    return render_template('login.html')

# index
@app.route('/')
def index():
    if 'loggedin' in session:
        return render_template('index.html')  # Jika sudah login, tampilkan halaman utama
    flash('Silakan login atau daftar terlebih dahulu', 'danger')
    return redirect(url_for('registrasi'))  # Arahkan ke halaman registrasi jika belum login

# logout
@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('username', None)
    session.pop('role', None)
    return redirect(url_for('login'))

#lihat user
@app.route('/lihat_user')
def lihat_user():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM tb_users')
        users = cursor.fetchall()  # Ambil semua data pengguna
        return render_template('lihat_user.html', users=users)  # Kirim data ke template
    flash('Silakan login terlebih dahulu', 'danger')
    return redirect(url_for('login'))  # Jika belum login, arahkan ke halaman login

# Delete user
@app.route('/delete_user/<int:id>', methods=['POST'])
def delete_user(id):
    if 'loggedin' in session:
        cursor = mysql.connection.cursor()
        try:
            cursor.execute('DELETE FROM tb_users WHERE id=%s', (id,))
            mysql.connection.commit()
            flash('User berhasil dihapus!', 'success')
        except Exception as e:
            flash(f'Error: {e}', 'danger')
        return redirect(url_for('lihat_user'))
    
    flash('Silakan login terlebih dahulu', 'danger')
    return redirect(url_for('login'))

#edit user
@app.route('/edit_user/<int:id>', methods=['GET', 'POST'])
def edit_user(id):
    if 'loggedin' in session:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM tb_users WHERE id=%s', (id,))
        user = cursor.fetchone()

        if user is None:
            flash('User tidak ditemukan', 'danger')
            return redirect(url_for('lihat_user'))

        if request.method == 'POST':
            username = request.form['username']
            email = request.form['email']
            role = request.form['role']

            try:
                cursor.execute("""
                    UPDATE tb_users 
                    SET username=%s, email=%s, role=%s 
                    WHERE id=%s
                """, (username, email, role, id))
                mysql.connection.commit()
                flash('User berhasil diperbarui!', 'success')
                return redirect(url_for('lihat_user'))
            except Exception as e:
                flash(f'Error: {e}', 'danger')

        return render_template('lihat_user.html', user=user, editing=True)

    flash('Silakan login terlebih dahulu', 'danger')
    return redirect(url_for('login'))

@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    if 'loggedin' in session:
        if request.method == 'POST':
            username = request.form['username']
            email = request.form['email']
            password = request.form['password']
            role = request.form['role']

            cursor = mysql.connection.cursor()

            # Cek jika email atau username sudah ada
            cursor.execute('SELECT * FROM tb_users WHERE username=%s OR email=%s', (username, email))
            user_exists = cursor.fetchone()
            if user_exists:
                flash('Username atau Email sudah digunakan.', 'danger')
                return render_template('add_user.html')

            # Masukkan pengguna baru ke dalam database
            cursor.execute('INSERT INTO tb_users (username, email, password, role) VALUES (%s, %s, %s, %s)',
                        (username, email, generate_password_hash(password), role))
            mysql.connection.commit()
            flash('Pengguna berhasil ditambahkan!', 'success')
            return redirect(url_for('lihat_user'))

        return render_template('add_user.html')

    flash('Silakan login terlebih dahulu', 'danger')
    return redirect(url_for('login'))

#profil
@app.route('/profil', methods=['GET'])
def profil():
    return render_template('profil.html')


if __name__ == '__main__':
    app.run(debug=True)
