# ProjectR

Bu proje, bir R projesidir.

## İçindekiler

1.  [Proje Açıklaması](#proje-açıklaması)
2.  [Lisans](#lisans)
3.  [Katkıda Bulunma](#katkıda-bulunma)
4.  [.gitignore Dosyası Açıklaması](#gitignore-dosyası-açıklaması)

## Proje Açıklaması

Bu GitHub deposu, **ProjectR** adlı bir R projesi içermektedir.  Projenin tam amacı veya işlevselliği hakkında daha fazla detay mevcut değildir.

## Lisans

Bu proje, GNU General Public License v3 altında lisanslanmıştır. Daha fazla bilgi için [LICENSE](LICENSE) dosyasına bakınız.

## Katkıda Bulunma

Katkıda bulunmak için aşağıdaki adımları izleyin:

1.  Projeyi fork edin.
2.  Yeni bir branch oluşturun (`git checkout -b feature/yeni-ozellik`).
3.  Değişikliklerinizi yapın.
4.  Değişikliklerinizi commit edin (`git commit -m "Yeni özellik eklendi"`).
5.  Branch'inizi push edin (`git push origin feature/yeni-ozellik`).
6.  Bir pull request oluşturun.

## .gitignore Dosyası Açıklaması

[.gitignore](.gitignore) dosyası, Git'in izlememesi gereken dosya ve klasörleri belirtir. Bu dosya, genellikle aşağıdaki türden dosyaları içerir:

*   `.Rhistory`: R oturum geçmişi dosyaları.
*   `.RData`: R çalışma alanı dosyaları.
*   `.Rproj.user/`: RStudio proje kullanıcı ayarları.
*   `*.tar.gz`: R CMD build çıktı dosyaları.
*   `*.Rcheck/`: R CMD check çıktı dosyaları.
*   `vignettes/*.html`, `vignettes/*.pdf`: Oluşturulmuş vinyetler.
*   `docs/`: pkgdown site dosyaları.
*   `rsconnect/`: RStudio Connect klasörü.
*   `.Renviron`: R ortam değişkenleri dosyası.
*   `po/*~`: Çeviri geçici dosyaları.

```
# History files
.Rhistory
.Rapp.history

# Session Data files
.RData
.RDataTmp

# User-specific files
.Ruserdata

# Example code in package build process
*-Ex.R

# Output files from R CMD build
/*.tar.gz

# Output files from R CMD check
/*.Rcheck/

# RStudio files
.Rproj.user/

# produced vignettes
vignettes/*.html
vignettes/*.pdf

# OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3
.httr-oauth

# knitr and R markdown default cache directories
*_cache/
/cache/

# Temporary files created by R markdown
*.utf8.md
*.knit.md

# R Environment Variables
.Renviron

# pkgdown site
docs/

# translation temp files
po/*~

# RStudio Connect folder
rsconnect/
