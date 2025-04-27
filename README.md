PostgreSQL - TurkStudentCo Ödevler

FinalProje Klasörü Hk.
# Online Eğitim Platformu Veritabanı Şeması (PostgreSQL)

Bu repository, online bir eğitim platformu için tasarlanmış PostgreSQL veritabanı şemasını içermektedir. Şema, kullanıcı yönetimi, eğitim içerikleri, kategoriler, kullanıcı kayıtları, sertifikalar ve blog gönderileri gibi temel işlevsellikleri destekleyecek şekilde modellenmiştir.

## Tablolar

Veritabanı aşağıdaki tablolardan oluşmaktadır:

* **members:** Platforma kayıtlı üyelerin bilgilerini (kullanıcı adı, e-posta, şifre, ad, soyad, kayıt tarihi vb.) saklar.
* **courses:** Platformdaki eğitimlerin bilgilerini (ad, açıklama, başlangıç/bitiş tarihi, eğitmen vb.) saklar.
* **categories:** Eğitim kategorilerini (örneğin, Yazılım, Tasarım, Pazarlama) yönetir.
* **course_categories:** Eğitimler ve kategoriler arasındaki çok-çok ilişkisini yönetir. Bir eğitim birden fazla kategoriye ait olabilir ve bir kategori birden fazla eğitim içerebilir.
* **enrollments:** Kullanıcıların hangi eğitimlere katıldığını takip eder. Kullanıcılar ve eğitimler arasındaki çok-çok ilişkisini yönetir.
* **certificates:** Tamamlanan eğitimler için sertifika bilgilerini (sertifika kodu, başlık, açıklama, oluşturulma tarihi vb.) saklar.
* **certificate_assignments:** Hangi kullanıcının hangi sertifikayı aldığını ilişkilendirir.
* **blog_posts:** Platformdaki blog gönderilerini (başlık, içerik, yayın tarihi, yazar bilgisi vb.) saklar.

## Temel Özellikler

* **İlişkisel Tasarım:** Tablolar arasında birincil ve yabancı anahtarlar aracılığıyla doğru ilişkiler kurulmuştur.
* **Veri Bütünlüğü:** `NOT NULL` ve `UNIQUE` kısıtlamaları ile veri bütünlüğü sağlanmaya çalışılmıştır. Yabancı anahtar kısıtlamalarında `ON DELETE CASCADE` kullanılarak ilişkili verilerin tutarlılığı korunur.
* **Otomatik Artan ID'ler:** Birincil anahtarlar genellikle `BIGSERIAL` veya `SMALLSERIAL` veri tipleri ile otomatik olarak artar.
* **Zaman Damgaları:** Kayıt ve işlem zamanları `TIMESTAMP WITH TIME ZONE` veri tipi ile tutulur.
* **Çok-Çok İlişkisi Yönetimi:** Eğitimler ve kategoriler ile kullanıcılar ve eğitimler arasındaki çok-çok ilişkileri ayrı ara tablolar ile doğru bir şekilde modellenmiştir.

