#' Mathieu's Custom Theme
#'
#' Custom ggplot2 themes for plots
#'
#' @param base_size Text size
#' @param base_family Text font
#' @param title.label Title
#' @param subtitle.label Subtitle
#' @param x.label X Label
#' @param y.label Y Label
#' @param x.watermark X coordinate for watermark
#' @param y.watermark Y coordinate for watermark
#' @param watermark.size Size of the watermark
#'
#' @return The ggplot2 theme
#' @export
#'
#' @examples
#' x.annot <- mean(player.bios$Height)
#' y.annot <- mean(player.bios$Weight)
#'
#' ggplot(player.bios,aes(x=Position,y=Weight)) +
#'  geom_boxplot() +
#'  theme_mathieu(title.label="NHL Height by Position",
#'                subtitle.label="A comparison of the heights of skaters who played in the NHL",
#'                x.label="Position",
#'                y.label="Weight",
#'                x.watermark=2.5,
#'                y.watermark=y.annot,
#'                watermark.size=10)

theme_mathieu <- function(base_size=14,base_family="",
                          title.label, subtitle.label, x.label, y.label,
                          x.watermark=NA, y.watermark=NA, watermark.size=NA){

  if (!is.na(x.watermark) | !is.na(y.watermark)){
    if (is.na(watermark.size)){
      watermark.size <- 20
    }
    watermark <- paste0("@mathieubray ",lubridate::year(lubridate::today()))
  } else {
    watermark <- ""
  }

  list(ggplot2::theme_bw(base_size, base_family),
       ggplot2::ggtitle(title.label, subtitle=subtitle.label),
       xlab(x.label),
       ylab(y.label),
       ggplot2::annotate("text",x=x.watermark,y=y.watermark,col="red",label=watermark,
             alpha=0.15,cex=watermark.size,fontface="bold",angle=30)
  )

}



