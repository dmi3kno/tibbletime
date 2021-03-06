% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/time_group.R
\name{time_group}
\alias{time_group}
\title{Generate a vector of time-based groupings}
\usage{
time_group(index, period = "yearly", start_date = NULL, ...)
}
\arguments{
\item{index}{A vector of date indices to create groups for.}

\item{period}{A formula or character specification used for time-based grouping.

If a formula, e.g. \code{1~year}, the formula is split and parsed to form the
grouping period. The \code{period} argument accepts a formula of the form
\code{multiple ~ period} allowing for flexible period grouping.
The following are examples:
\itemize{
\item 1 Year: \code{1~y}
\item 3 Months: \code{3~m}
\item 90 Days: \code{90~d}
}

Note that while shorthand is used above, an attempt is made to recognize
more explicit period names such as:
\itemize{
\item 2 Year: \code{2~year} / \code{2~years} / \code{2~yearly}
}

The \code{period} argument also accepts characters that are converted to their
corresponding periods. The following are accepted:
\itemize{
\item \code{"yearly"} or \code{"y"}
\item \code{"quarterly"} or \code{"q"}
\item \code{"monthly"} or \code{"m"}
\item \code{"weekly"} or \code{"w"}
\item \code{"daily"} or \code{"d"}
\item \code{"hour"} or \code{"h"}
\item \code{"minute"} or \code{"M"}
\item \code{"second"} or \code{"s"}
}}

\item{start_date}{Optional argument used to specify the start date for the
first group. The default is to start at the closest period boundary
below the minimum date in the supplied index.}

\item{...}{Not currently used.}
}
\description{
\code{\link[=time_group]{time_group()}} accepts a date index vector and returns an integer vector that
can be used for grouping by periods.
}
\details{
This function is used internally, but may provide the user extra flexibility
when they need to perform a grouped operation not supported by \code{tibbletime}.

Grouping can only be done on the minimum periodicity of the index and above.
This means that a daily series cannot be grouped by minute. An hourly series
cannot be grouped by 5 seconds, and so on. If the user attempts this,
groups will be returned at the minimum periodicity (a daily series will
return 1 group per day).

The \code{start_date} argument allows the user to control where the periods begin.

This function respects \code{\link[dplyr:group_by]{dplyr::group_by()}} groups.
}
\examples{

data(FB)

time_group(FB$date, 2~y)

dplyr::mutate(FB, time_group = time_group(date, 2~d))

}
\seealso{
\code{\link[=as_period]{as_period()}}, \code{\link[=create_series]{create_series()}}
}
