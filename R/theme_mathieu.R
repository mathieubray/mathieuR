#' Mathieu's Custom Theme
#'
#' Custom ggplot2 themes for plots
#'
#' @param title.label Title
#' @param x.label X Label
#' @param y.label Y Label
#' @param subtitle.label Subtitle
#' @param base_size Font size
#' @param watermark.coord Coordinates for watermark
#' @param watermark.size Size of the watermark
#' @param watermark.alpha Transparency of the watermark
#' @param watermark.angle Angle of the watermark
#' @param watermark.color Color of the watermark
#'
#' @return The ggplot2 theme
#' @export
#'
#' @examples
#' ggplot(mtcars, aes(x=wt,y=qsec)) +
#' geom_point() +
#' theme_mathieu(title.label="mathieuR Theme Example",
#' subtitle.label="Compares wt and qsec of the mtcars dataset",
#' x.label = "Weight",
#' y.label = "QSEC",
#' watermark.coord=c(mean(mtcars$wt), mean(mtcars$qsec)))

theme_mathieu <- function(title.label,
                          x.label="",
                          y.label="",
                          subtitle.label="",
                          base_size=14,
                          watermark.coord=NULL,
                          watermark.size=15,
                          watermark.alpha=0.15,
                          watermark.angle=30,
                          watermark.color="red"){

  if (!is.null(watermark.coord)){
    watermark <- paste0("@mathieubray ",lubridate::year(lubridate::today()))
  } else {
    watermark <- ""
  }

  list(ggplot2::theme_bw(base_size = base_size),
       ggplot2::ggtitle(title.label, subtitle=subtitle.label),
       xlab(x.label),
       ylab(y.label),
       ggplot2::annotate("text",x=watermark.coord[1],y=watermark.coord[2],col=watermark.color,label=watermark,
             alpha=watermark.alpha,cex=watermark.size,fontface="bold",angle=watermark.angle)
  )

}



