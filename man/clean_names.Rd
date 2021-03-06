% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_names.R
\name{clean_names}
\alias{clean_names}
\alias{clean_names.data.frame}
\alias{clean_names.default}
\alias{clean_names.sf}
\alias{clean_names.tbl_graph}
\title{Cleans names of an object (usually a data.frame).}
\usage{
clean_names(dat, ...)

\method{clean_names}{data.frame}(dat, ...)

\method{clean_names}{default}(dat, ...)

\method{clean_names}{sf}(dat, ...)

\method{clean_names}{tbl_graph}(dat, ...)
}
\arguments{
\item{dat}{the input data.frame.}

\item{...}{
  Arguments passed on to \code{\link[=make_clean_names]{make_clean_names}}
  \describe{
    \item{\code{case}}{The desired target case (default is \code{"snake"}) will be
passed to \code{snakecase::to_any_case()} with the exception of "old_janitor",
which exists only to support legacy code (it preserves the behavior of
\code{clean_names()} prior to addition of the "case" argument (janitor
versions <= 0.3.1).  "old_janitor" is not intended for new code. See
\code{\link[snakecase]{to_any_case}} for a wide variety of supported cases,
including "sentence" and "title" case.}
    \item{\code{replace}}{A named character vector where the name is replaced by the
value.}
    \item{\code{ascii}}{Convert the names to ASCII (\code{TRUE}, default) or not
(\code{FALSE}).}
    \item{\code{use_make_names}}{Should \code{make.names()} be applied to ensure that the
output is usable as a name without quoting?  (Avoiding \code{make.names()}
ensures that the output is locale-independent but quoting may be required.)}
    \item{\code{sep_in}}{(short for separator input) if character, is interpreted as a
regular expression (wrapped internally into \code{stringr::regex()}). 
The default value is a regular expression that matches any sequence of
non-alphanumeric values. All matches will be replaced by underscores 
(additionally to \code{"_"} and \code{" "}, for which this is always true, even
if \code{NULL} is supplied). These underscores are used internally to split
the strings into substrings and specify the word boundaries.}
    \item{\code{transliterations}}{A character vector (if not \code{NULL}). The entries of this argument
need to be elements of \code{stringi::stri_trans_list()} (like "Latin-ASCII", which is often useful) or names of lookup tables (currently only "german" is supported). In the order of the entries the letters of the input
 string will be transliterated via \code{stringi::stri_trans_general()} or replaced via the 
 matches of the lookup table. When named character elements are supplied as part of `transliterations`, anything that matches the names is replaced by the corresponding value.
You should use this feature with care in case of \code{case = "parsed"}, \code{case = "internal_parsing"} and 
\code{case = "none"}, since for upper case letters, which have transliterations/replacements
 of length 2, the second letter will be transliterated to lowercase, for example Oe, Ae, Ss, which
 might not always be what is intended. In this case you can make usage of the option to supply named elements and specify the transliterations yourself.}
    \item{\code{parsing_option}}{An integer that will determine the parsing_option.
\itemize{
 \item{1: \code{"RRRStudio" -> "RRR_Studio"}}
 \item{2: \code{"RRRStudio" -> "RRRS_tudio"}}
 \item{3: \code{"RRRStudio" -> "RRRSStudio"}. This will become for example \code{"Rrrstudio"} when we convert to lower camel case.}
 \item{-1, -2, -3: These \code{parsing_options}'s will suppress the conversion after non-alphanumeric values.}
 \item{0: no parsing}
 }}
    \item{\code{numerals}}{A character specifying the alignment of numerals (\code{"middle"}, \code{left}, \code{right}, \code{asis} or \code{tight}). I.e. \code{numerals = "left"} ensures that no output separator is in front of a digit.}
  }}
}
\value{
Returns the data.frame with clean names.
}
\description{
Resulting names are unique and consist only of the \code{_} character, numbers, and letters.
Capitalization preferences can be specified using the \code{case} parameter.

Accented characters are transliterated to ASCII.  For example, an "o" with a
German umlaut over it becomes "o", and the Spanish character "enye" becomes
"n".

This function takes and returns a data.frame, for ease of piping with
\code{`\%>\%`}. For the underlying function that works on a character vector
of names, see \code{\link[janitor]{make_clean_names}}.
}
\details{
\code{clean_names()} is intended to be used on \code{data.frames}
  and \code{data.frame} like objects. For this reason there are methods to
  support using \code{clean_names()} on \code{sf} and \code{tbl_graph} (from
  \code{tidygraph}) objects. For cleaning named lists and vectors, consider
  using \code{make_clean_names()}.
}
\examples{
# not run:
# clean_names(poorly_named_df)

# or pipe in the input data.frame:
# poorly_named_df \%>\% clean_names()

# if you prefer camelCase variable names:
# poorly_named_df \%>\% clean_names(., "small_camel")

# not run:
# library(readxl)
# read_excel("messy_excel_file.xlsx") \%>\% clean_names()
}
