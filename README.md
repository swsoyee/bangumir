
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

|    | Image                                                            | Anime                                                            | Watching | Overall Rating | Average Score |
| :- | :--------------------------------------------------------------- | :--------------------------------------------------------------- | -------: | -------------: | ------------: |
| 1  | ![262897](http://lain.bgm.tv/pic/cover/g/0f/50/262897_Lfm1T.jpg) | [ゆるキャン△ SEASON 2](http://bgm.tv/subject/262897)                  |     1257 |            263 |           8.7 |
| 2  | ![316247](http://lain.bgm.tv/pic/cover/g/aa/64/316247_a6jUR.jpg) | [Re:ゼロから始める異世界生活 2nd season 後半クール](http://bgm.tv/subject/316247) |      985 |            149 |           7.7 |
| 3  | ![279202](http://lain.bgm.tv/pic/cover/g/64/81/279202_tMc9C.jpg) | [約束のネバーランド Season 2](http://bgm.tv/subject/279202)               |      905 |            124 |           7.3 |
| 4  | ![297224](http://lain.bgm.tv/pic/cover/g/f4/44/297224_eE7lv.jpg) | [BEASTARS 2nd Season](http://bgm.tv/subject/297224)              |      774 |             95 |           7.6 |
| 5  | ![315069](http://lain.bgm.tv/pic/cover/g/23/a2/315069_QlT2S.jpg) | [ホリミヤ](http://bgm.tv/subject/315069)                             |      671 |             76 |           7.3 |
| 6  | ![301601](http://lain.bgm.tv/pic/cover/g/e6/f6/301601_9TO1X.jpg) | [裏世界ピクニック](http://bgm.tv/subject/301601)                         |      592 |             86 |           6.8 |
| 7  | ![304065](http://lain.bgm.tv/pic/cover/g/bf/76/304065_4Crea.jpg) | [はたらく細胞BLACK](http://bgm.tv/subject/304065)                      |      591 |             67 |           7.8 |
| 8  | ![292527](http://lain.bgm.tv/pic/cover/g/c8/42/292527_YtaWi.jpg) | [弱キャラ友崎くん](http://bgm.tv/subject/292527)                         |      590 |             89 |           5.7 |
| 9  | ![278815](http://lain.bgm.tv/pic/cover/g/ae/11/278815_veMhu.jpg) | [はたらく細胞\!\!](http://bgm.tv/subject/278815)                       |      579 |             62 |           7.2 |
| 10 | ![278031](http://lain.bgm.tv/pic/cover/g/e6/78/278031_202kC.jpg) | [転生したらスライムだった件 第2期](http://bgm.tv/subject/278031)                |      559 |             58 |           7.4 |
| 11 | ![252782](http://lain.bgm.tv/pic/cover/g/83/73/252782_6PjZ1.jpg) | [蜘蛛ですが、なにか?](http://bgm.tv/subject/252782)                       |      551 |             78 |           6.6 |
| 12 | ![277554](http://lain.bgm.tv/pic/cover/g/8b/00/277554_tG28z.jpg) | [無職転生 ～異世界行ったら本気だす～](http://bgm.tv/subject/277554)               |      544 |             43 |           8.2 |
| 13 | ![282000](http://lain.bgm.tv/pic/cover/g/6c/00/282000_Hax2m.jpg) | [五等分の花嫁∬](http://bgm.tv/subject/282000)                          |      537 |             76 |           7.1 |
| 14 | ![282684](http://lain.bgm.tv/pic/cover/g/ac/b7/282684_0B301.jpg) | [のんのんびより のんすとっぷ](http://bgm.tv/subject/282684)                   |      416 |             36 |           8.3 |
| 15 | ![293193](http://lain.bgm.tv/pic/cover/g/98/e5/293193_d88nd.jpg) | [たとえばラストダンジョン前の村の少年が序盤の街で暮らすような物語](http://bgm.tv/subject/293193) |      411 |             68 |           6.3 |
| 16 | ![315574](http://lain.bgm.tv/pic/cover/g/1c/6b/315574_tLgrT.jpg) | [ウマ娘 プリティーダービー Season 2](http://bgm.tv/subject/315574)           |      390 |             60 |           7.6 |
| 17 | ![304827](http://lain.bgm.tv/pic/cover/g/b6/39/304827_Bbn7q.jpg) | [天地創造デザイン部](http://bgm.tv/subject/304827)                        |      343 |             56 |           6.7 |
| 18 | ![297396](http://lain.bgm.tv/pic/cover/g/94/8c/297396_xJK3Q.jpg) | [バック・アロウ](http://bgm.tv/subject/297396)                          |      271 |             33 |           6.9 |
| 19 | ![296261](http://lain.bgm.tv/pic/cover/g/50/b5/296261_i3iaJ.jpg) | [Dr.STONE STONE WARS](http://bgm.tv/subject/296261)              |      269 |             16 |           7.8 |
| 20 | ![195723](http://lain.bgm.tv/pic/cover/g/91/4d/195723_z322N.jpg) | [ゲキドル](http://bgm.tv/subject/195723)                             |      268 |             29 |           6.2 |

## Code of Conduct

Please note that the bangumir project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
