% Fakta: hubungan keluarga
orangtua(agus, ani).
orangtua(agus, budi).
orangtua(ani, cindy).
orangtua(budi, aska).
orangtua(cindy, eva).
orangtua(aska, faiz).

% Fakta: jenis kelamin
laki_laki(agus).
laki_laki(budi).
laki_laki(aska).
laki_laki(faiz).

perempuan(ani).
perempuan(cindy).
perempuan(eva).

% Fakta: umur
umur(agus, 50).
umur(ani, 48).
umur(budi, 25).
umur(cindy, 22).
umur(aska, 30).
umur(eva, 5).
umur(faiz, 2).

% Aturan: X adalah ayah dari Y jika X adalah orang tua dari Y dan X adalah pria
ayah(X, Y) :- orangtua(X, Y), laki_laki(X), umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah ibu dari Y jika X adalah orang tua dari Y dan X adalah wanita
ibu(X, Y) :- orangtua(X, Y), perempuan(X), umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah anak dari Y jika Y adalah orang tua dari X
anak(X, Y) :- orangtua(Y, X), umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah kakak dari Y jika X dan Y memiliki orang tua yang sama dan X lebih tua dari Y
saudara(X, Y) :- orangtua(Z, X), orangtua(Z, Y), X \= Y, umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah adik dari Y jika X dan Y memiliki orang tua yang sama dan X lebih muda dari Y
adik(X, Y) :- saudara(Y, X), X \= Y, umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah kakek dari Y jika X adalah orang tua dari Z dan Z adalah orang tua dari Y
kakek(X, Y) :- orangtua(X, Z), orangtua(Z, Y), laki_laki(X), umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah nenek dari Y jika X adalah orang tua dari Z dan Z adalah orang tua dari Y
nenek(X, Y) :- orangtua(X, Z), orangtua(Z, Y), perempuan(X), umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah cucu dari Y jika Y adalah kakek atau nenek dari X
cucu(X, Y) :- (kakek(Y, X); nenek(Y, X)), umur(X, UmurX), umur(Y, UmurY).

% Aturan: X adalah buyut dari Y jika Y adalah kakek atau nenek dari Z dan Z adalah orang tua dari X
buyut(X, Y) :- (kakek(Y, Z); nenek(Y, Z)), orangtua(Z, X), umur(X, UmurX), umur(Y, UmurY), umur(Z, UmurZ).

% Aturan: X adalah sepupu dari Y jika orang tua X adalah saudara dari orang tua Y
sepupu(X, Y) :- orangtua(A, X), orangtua(B, Y), saudara(A, B), X \= Y, umur(X, UmurX), umur(Y, UmurY).

% contoh penggunaan
% ayah(Ayah, Anak), umur(Ayah, UmurAyah), umur(Anak, UmurAnak), UmurAyah > 30, UmurAnak > 30.
% sepupu(X, Y), umur(X, UmurX), umur(Y, UmurY), UmurX > 20, UmurY > 20.
% nenek(Nenek, Cucu), umur(Nenek, UmurNenek), UmurNenek > 40.
% saudara(Kakak, Adik), umur(Kakak, UmurKakak), UmurKakak > 35.
% buyut(Buyut, KakekNenek), umur(Buyut, UmurBuyut), UmurBuyut < 10.
