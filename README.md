
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bangumir

<!-- badges: start -->

[![R build
status](https://github.com/swsoyee/bangumir/workflows/R-CMD-check/badge.svg)](https://github.com/swsoyee/bangumir/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/swsoyee/bangumir/branch/master/graph/badge.svg?token=WU6UMG8S4C)](https://codecov.io/gh/swsoyee/bangumir)
<!-- badges: end -->

The goal of bangumir is to …

## Installation

~~You can install the released version of bangumir from
[CRAN](https://CRAN.R-project.org) with:~~

``` r
# Not available now
# install.packages("bangumir")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("swsoyee/bangumir")
```

## Example

1.  Hottest 20 anime in this season, but air dates are later than 2020:

<!-- end list -->

``` r
library(bangumir)
library(data.table)

result <- bgm_calendar(format = "table")

# filter result
fitered <- result[
  air_date > "2020-01-01",
  .("Image" = sprintf("![%s](%s)", id, images.grid),
    "Anime" = sprintf("[%s](%s)", name, url),
    "Watching" = collection.doing,
    "Overall Rating" = rating.total,
    "Average Score" = rating.score
    )
]

# order by watching user count and get the best 20
final <- head(fitered[order(-Watching)], n = 20)

# display the result
knitr::kable(final, row.names = TRUE)
```

|    | Image                                                            | Anime                                                      | Watching | Overall Rating | Average Score |
| :- | :--------------------------------------------------------------- | :--------------------------------------------------------- | -------: | -------------: | ------------: |
| 1  | ![306429](http://lain.bgm.tv/pic/cover/g/10/d5/306429_aIAux.jpg) | [神様になった日](http://bgm.tv/subject/306429)                    |     2709 |            756 |           6.8 |
| 2  | ![292970](http://lain.bgm.tv/pic/cover/g/99/17/292970_mxMxx.jpg) | [魔女の旅々](http://bgm.tv/subject/292970)                      |     2392 |            809 |           7.0 |
| 3  | ![294993](http://lain.bgm.tv/pic/cover/g/60/fe/294993_JrrzK.jpg) | [呪術廻戦](http://bgm.tv/subject/294993)                       |     2219 |            662 |           7.5 |
| 4  | ![301541](http://lain.bgm.tv/pic/cover/g/66/50/301541_p2z4K.jpg) | [トニカクカワイイ](http://bgm.tv/subject/301541)                   |     1787 |            603 |           6.5 |
| 5  | ![282372](http://lain.bgm.tv/pic/cover/g/0f/a4/282372_hzhyM.jpg) | [安達としまむら](http://bgm.tv/subject/282372)                    |     1646 |            446 |           7.2 |
| 6  | ![292712](http://lain.bgm.tv/pic/cover/g/61/f8/292712_pACzh.jpg) | [アサルトリリィ BOUQUET](http://bgm.tv/subject/292712)            |     1513 |            399 |           6.7 |
| 7  | ![302076](http://lain.bgm.tv/pic/cover/g/87/96/302076_Oixgz.jpg) | [アクダマドライブ](http://bgm.tv/subject/302076)                   |     1506 |            439 |           6.8 |
| 8  | ![290426](http://lain.bgm.tv/pic/cover/g/b1/c3/290426_z4GRp.jpg) | [魔王城でおやすみ](http://bgm.tv/subject/290426)                   |     1317 |            399 |           6.9 |
| 9  | ![297969](http://lain.bgm.tv/pic/cover/g/1e/83/297969_Cn5jJ.jpg) | [ひぐらしのなく頃に 業](http://bgm.tv/subject/297969)                |     1272 |            283 |           7.4 |
| 10 | ![260770](http://lain.bgm.tv/pic/cover/g/0a/16/260770_4548k.jpg) | [ご注文はうさぎですか？ BLOOM](http://bgm.tv/subject/260770)          |     1230 |            357 |           7.9 |
| 11 | ![302418](http://lain.bgm.tv/pic/cover/g/02/7e/302418_0sZ4N.jpg) | [無能なナナ](http://bgm.tv/subject/302418)                      |     1104 |            313 |           6.6 |
| 12 | ![291412](http://lain.bgm.tv/pic/cover/g/b6/d5/291412_G5EHw.jpg) | [ダンジョンに出会いを求めるのは間違っているだろうかⅢ](http://bgm.tv/subject/291412) |      953 |            222 |           6.9 |
| 13 | ![301233](http://lain.bgm.tv/pic/cover/g/40/5b/301233_mq8zr.jpg) | [One Room サードシーズン](http://bgm.tv/subject/301233)           |      860 |            207 |           7.1 |
| 14 | ![292273](http://lain.bgm.tv/pic/cover/g/20/f7/292273_15ZAe.jpg) | [キミと僕の最後の戦場、あるいは世界が始まる聖戦](http://bgm.tv/subject/292273)    |      826 |            255 |           5.9 |
| 15 | ![296659](http://lain.bgm.tv/pic/cover/g/a7/35/296659_o709D.jpg) | [ラブライブ！虹ヶ咲学園スクールアイドル同好会](http://bgm.tv/subject/296659)     |      806 |            219 |           7.6 |
| 16 | ![297624](http://lain.bgm.tv/pic/cover/g/90/61/297624_nANa9.jpg) | [くまクマ熊ベアー](http://bgm.tv/subject/297624)                   |      750 |            250 |           5.9 |
| 17 | ![301469](http://lain.bgm.tv/pic/cover/g/08/01/301469_cPTHi.jpg) | [100万の命の上に俺は立っている](http://bgm.tv/subject/301469)           |      746 |            241 |           5.4 |
| 18 | ![279059](http://lain.bgm.tv/pic/cover/g/0d/2e/279059_NNOnk.jpg) | [おちこぼれフルーツタルト](http://bgm.tv/subject/279059)               |      738 |            170 |           6.6 |
| 19 | ![292233](http://lain.bgm.tv/pic/cover/g/43/a5/292233_Xzs8x.jpg) | [魔法科高校の劣等生 来訪者編](http://bgm.tv/subject/292233)             |      718 |            161 |           6.4 |
| 20 | ![301369](http://lain.bgm.tv/pic/cover/g/ec/05/301369_Yyp7J.jpg) | [戦翼のシグルドリーヴァ](http://bgm.tv/subject/301369)                |      693 |            181 |           6.4 |

## Code of Conduct

Please note that the bangumir project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
