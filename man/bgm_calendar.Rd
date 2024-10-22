% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bgm-calendar.R
\name{bgm_calendar}
\alias{bgm_calendar}
\title{Get bangumi calendar}
\usage{
bgm_calendar(format = c("list", "table", "default"))
}
\arguments{
\item{format}{Result will be a list of json data when set to \code{list}
(default), \code{response()} object when set to \code{default}. Set to
\code{table} will convert the list to a \code{data.frame} for ease of use.}
}
\value{
A list of response content or a \code{response()} object according to
the \code{format} option.
}
\description{
Get bangumi calendar
}
\examples{
bgm_calendar("table")
}
