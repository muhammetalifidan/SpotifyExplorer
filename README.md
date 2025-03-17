# ProjectR

Bu proje, Spotify API'si ile etkileşim kurmak için oluşturulmuş bir R projesidir. Belirli sanatçıları arama ve popüler şarkılarını alma gibi işlevleri içerir.

## İçindekiler

1.  [Açıklama](#açıklama)
2.  [Kurulum](#kurulum)
3.  [Kullanım](#kullanım)
4.  [Bağımlılıklar](#bağımlılıklar)
5.  [Katkıda Bulunma](#katkıda-bulunma)
6.  [Lisans](#lisans)
7.  [Dosya Açıklamaları](#dosya-açıklamaları)
8.  [API Referansı](#api-referansı)

## Açıklama

Bu repository, Spotify API'sini kullanarak çeşitli görevleri gerçekleştiren R scriptleri içerir. Temel fonksiyonlar şunlardır:

*   **Spotify Token Alma:** Spotify API'sine erişim için gerekli olan token'ı alır.
*   **Sanatçı Arama:** Verilen bir sanatçı adına göre Spotify'da sanatçı arar.
*   **Popüler Şarkıları Listeleme:** Bir sanatçı ID'si kullanarak sanatçının en popüler şarkılarını listeler.

## Kurulum

Projenin düzgün çalışması için aşağıdaki adımları izleyin:

1.  R ve RStudio'nun kurulu olduğundan emin olun.

2.  Gerekli paketleri yükleyin:

    ```R
    install.packages("httr")
    install.packages("testthat")
    ```

3.  Spotify API'sini kullanmak için bir Spotify Developer hesabına sahip olmanız ve bir uygulama oluşturmanız gerekir.

4.  `SPOTIFY_ID` ve `SPOTIFY_SECRET` adlı iki ortam değişkeni tanımlayın. Bu değişkenler, Spotify Developer hesabınızdan elde edeceğiniz Client ID ve Client Secret değerlerini içermelidir.

    Ortam değişkenlerini ayarlamak için `.Renviron` dosyasını kullanabilirsiniz. Eğer böyle bir dosya yoksa, projenizin kök dizininde oluşturun ve aşağıdaki formatta bilgilerinizi ekleyin:

    ```
    SPOTIFY_ID="your_client_id"
    SPOTIFY_SECRET="your_client_secret"
    ```

    `.Renviron` dosyasını kaydettikten sonra, `readRenviron()` fonksiyonunu kullanarak ortam değişkenlerini R oturumunuza yükleyin:

    ```R
    readRenviron(".Renviron")
    ```

    Alternatif olarak, oturumunuzun başında ortam değişkenlerini doğrudan ayarlayabilirsiniz:

    ```R
    Sys.setenv(SPOTIFY_ID = "your_client_id")
    Sys.setenv(SPOTIFY_SECRET = "your_client_secret")
    ```

## Kullanım

1.  Gerekli R script'ini (`Labex_Q1.R`, `Labex_Q2.R`, `Labex_Q3.R` veya `Labex_Q4.R`) RStudio'da açın.

2.  Script'i çalıştırın. Örneğin, `Labex_Q4.R` script'ini çalıştırmak için:

    ```R
    source("coderlog/Labex_Q4.R")
    ```

3.  Fonksiyonları çağırın ve sonuçları inceleyin. Örneğin:

    ```R
    token <- spotify_token()
    print(token)

    artists <- spotify_search_artist("Eminem")
    print(artists)

    tracks <- spotify_artist_top_tracks("0TnOYISbd1XYRBk9myaseg")
    print(tracks)
    ```

## Bağımlılıklar

*   **httr:** HTTP istekleri yapmak için kullanılır.

*   **testthat:** R'da testler yazmak ve çalıştırmak için kullanılır.

## Katkıda Bulunma

1.  Bu repository'i fork edin.
2.  Branch'inizi oluşturun (`git checkout -b feature/your-feature`).
3.  Değişikliklerinizi commit edin (`git commit -m 'Add some feature'`).
4.  Branch'inizi push edin (`git push origin feature/your-feature`).
5.  Pull Request oluşturun.

## Lisans

Bu proje, [GNU General Public License v3.0](LICENSE) altında lisanslanmıştır.

## Dosya Açıklamaları

*   `.gitignore`: Git tarafından izlenmemesi gereken dosyaları belirtir (örneğin, `.Rhistory`, `.RData`).
*   `LICENSE`: Projenin lisans bilgilerini içerir (GNU General Public License v3.0).
*   `coderlog/Labex_Q1.R`: Spotify API'sinden token almak için bir fonksiyon içerir.
*   `coderlog/Labex_Q1_tests.R`: `Labex_Q1.R` script'i için testler içerir.
*   `coderlog/Labex_Q2.R`: Spotify API'sinden token almak ve sanatçı adına göre arama yapmak için fonksiyonlar içerir.
*   `coderlog/Labex_Q2_tests.R`: `Labex_Q2.R` script'i için testler içerir.
*   `coderlog/Labex_Q3.R`: Spotify API'sinden token almak, sanatçı adına göre arama yapmak ve sanatçının popüler şarkılarını listelemek için fonksiyonlar içerir.
*   `coderlog/Labex_Q3_tests.R`: `Labex_Q3.R` script'i için testler içerir.
*   `coderlog/Labex_Q4.R`: Spotify API'sinden token almak, sanatçı adına göre arama yapmak ve sanatçının popüler şarkılarını listelemek için fonksiyonlar içerir. Hata kontrolleri eklenmiştir.

## API Referansı

| Endpoint                                  | Parametreler     | Açıklama                               | Tip     |
| ----------------------------------------- | ---------------- | -------------------------------------- | ------- |
| `POST https://accounts.spotify.com/api/token` | `grant_type`, `client_id`, `client_secret` | Spotify API'sinden token alır.         | POST    |
| `GET https://api.spotify.com/v1/search`    | `q`, `type`, `limit`  | Sanatçı adına göre Spotify'da arama yapar. | GET     |
| `GET https://api.spotify.com/v1/artists/{artist_id}/top-tracks` | `market`         | Sanatçı ID'sine göre popüler şarkıları listeler. | GET     |