
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

result <- bgm_calendar(format = "table")

# filter result
fitered <- result[
  air_date > "2020-01-01",
  .(name, collection.doing, rating.total, rating.score)
]

# order and get the best 20
final <- head(fitered[order(-collection.doing)], n = 20)

# order by watching user count and show the result
knitr::kable(final, row.names = TRUE)
```

|    | name                       | collection.doing | rating.total | rating.score |
| :- | :------------------------- | ---------------: | -----------: | -----------: |
| 1  | 神様になった日                    |             2709 |          756 |          6.8 |
| 2  | 魔女の旅々                      |             2392 |          809 |          7.0 |
| 3  | 呪術廻戦                       |             2217 |          661 |          7.5 |
| 4  | トニカクカワイイ                   |             1787 |          603 |          6.5 |
| 5  | 安達としまむら                    |             1646 |          446 |          7.2 |
| 6  | アサルトリリィ BOUQUET            |             1513 |          399 |          6.7 |
| 7  | アクダマドライブ                   |             1506 |          439 |          6.8 |
| 8  | 魔王城でおやすみ                   |             1317 |          399 |          6.9 |
| 9  | ひぐらしのなく頃に 業                |             1273 |          283 |          7.4 |
| 10 | ご注文はうさぎですか？ BLOOM          |             1230 |          357 |          7.9 |
| 11 | 無能なナナ                      |             1103 |          313 |          6.6 |
| 12 | ダンジョンに出会いを求めるのは間違っているだろうかⅢ |              953 |          222 |          6.9 |
| 13 | One Room サードシーズン           |              860 |          207 |          7.1 |
| 14 | キミと僕の最後の戦場、あるいは世界が始まる聖戦    |              825 |          255 |          5.9 |
| 15 | ラブライブ！虹ヶ咲学園スクールアイドル同好会     |              806 |          218 |          7.6 |
| 16 | くまクマ熊ベアー                   |              750 |          250 |          5.9 |
| 17 | 100万の命の上に俺は立っている           |              746 |          241 |          5.4 |
| 18 | おちこぼれフルーツタルト               |              738 |          170 |          6.6 |
| 19 | 魔法科高校の劣等生 来訪者編             |              718 |          161 |          6.4 |
| 20 | 戦翼のシグルドリーヴァ                |              693 |          181 |          6.4 |

## Code of Conduct

Please note that the bangumir project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
