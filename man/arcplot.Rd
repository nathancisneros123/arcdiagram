\name{arcplot}
\alias{arcplot}
\title{Arc Diagram Plot}
\usage{
  arcplot(edgelist, vertices, sorted = FALSE,
    decreasing = FALSE, ordering = NULL, labels = NULL,
    horizontal = TRUE, above = NULL,
    col.arcs = "#5998ff77", lwd.arcs = 1.8, lty.arcs = 1,
    lend = 1, ljoin = 2, lmitre = 1, show.nodes = TRUE,
    pch.nodes = 19, cex.nodes = 1, col.nodes = "gray80",
    bg.nodes = "gray80", lwd.nodes = 1, show.labels = TRUE,
    col.labels = "gray55", cex.labels = 0.9, las = 2,
    font = 1, line = 0, outer = FALSE, adj = NA, padj = NA,
    axes = FALSE, ...)
}
\arguments{
  \item{edgelist}{basically a two-column matrix with edges
  (see \code{\link{graph}})}

  \item{vertices}{optional vector of vertex names
  corresponding with those in the edgelist}

  \item{sorted}{logical to indicate if nodes should be
  sorted (default \code{FALSE})}

  \item{decreasing}{logical to indicate type of sorting
  (used only when \code{sorted=TRUE})}

  \item{ordering}{optional numeric or string vector
  providing the ordering of nodes. When provided, this
  parameter overrides \code{sorted=TRUE}). See the details
  section for more information.}

  \item{labels}{optional string vector with labels for the
  nodes}

  \item{horizontal}{logical indicating whether to plot in
  horizontal orientation}

  \item{above}{optional vector indicating which arcs should
  be displayed above (or to the right) and below (or to the
  left) of the axis}

  \item{col.arcs}{color for the arcs (default
  \code{"gray50"})}

  \item{lwd.arcs}{line width for the arcs (default 1)}

  \item{lty.arcs}{line type for the arcs (see
  \code{\link{par}})}

  \item{lend}{the line end style for the arcs (see
  \code{\link{par}})}

  \item{ljoin}{the line join style for the arcs (see
  \code{\link{par}})}

  \item{lmitre}{the line mitre limit for the arcs (see
  \code{\link{par}})}

  \item{show.nodes}{logical indicating whether to show node
  symbols}

  \item{pch.nodes}{plotting 'character', i.e. symbol to use
  when plotting nodes (\code{pch.nodes=0:25})}

  \item{cex.nodes}{expansion of the node symbols (default
  1)}

  \item{col.nodes}{color of the node symbols (default
  \code{"gray50"})}

  \item{bg.nodes}{background (fill) color for the node
  symbols given by \code{pch.nodes=21:25}}

  \item{lwd.nodes}{line width for drawing node symbols (see
  \code{\link{points}})}

  \item{show.labels}{logical indicating whether to show
  node labels}

  \item{col.labels}{color of the node labels (default
  \code{"gray50"})}

  \item{cex.labels}{expansion of node labels (default
  \code{"gray50"})}

  \item{las}{numeric in {0,1,2,3}; the style of axis labels
  (see \code{\link{par}})}

  \item{font}{font used for node labels (see
  \code{\link{par}})}

  \item{line}{on which margin line the node labels are
  displayed, starting at 0 counting outwards (see
  \code{\link{mtext}})}

  \item{outer}{use outer margins, if available, to plot
  node labels (see \code{\link{mtext}})}

  \item{adj}{adjustment for each string in reading
  direction (see \code{\link{mtext}})}

  \item{padj}{adjustment for each string perpendicular to
  the reading direction (see \code{\link{mtext}})}

  \item{axes}{logical indicating whether to plot the axes
  (default \code{FALSE})}

  \item{...}{further graphical parameters (see
  \code{\link{par}}), including \code{family}, \code{xpd},
  \code{main}, \code{asp}, etc.}
}
\description{
  Give me an edgelist and I'll help you plot a pretty damn
  arc diagram
}
\details{
  The arcs are scaled such that they fit in a plot region
  with its x-axis ranging from zero to one. Node symbols
  and labels can be optionally displayed. Node symbols are
  displayed through the function \code{points}. In turn,
  node labels are displayed through the function
  \code{mtext}.

  When \code{ordering} is provided in numeric format and
  node labels are strings, the labels are alphabetically
  ordered first, and then nodes are sorted according to the
  provided \code{ordering}.

  If \code{ordering} is provided in string format, the node
  labels must be strings as well. The nodes will be sorted
  according to \code{ordering}.
}
\examples{
\dontrun{
 # create an edgelist
 un_graphe <- rbind(
 c("fromage", "pain"),
 c("pain", "vin"),
 c("vin", "biere"),
 c("cidre", "biere"),
 c("foie", "fromage"),
 c("pain", "foie"))

 # deafult arcplot
 arcplot(un_graphe)
 # vertical display
 arcplot(un_graphe, horizontal=FALSE)
 # arcplot with arcs above and below axis
 arcplot(un_graphe, above = c(1, 3, 5))
 # nodes sorted alphabetically (increasing)
 arcplot(un_graphe, sorted=TRUE)
 # nodes sorted alphabetically (decreasing)
 arcplot(un_graphe, sorted=TRUE, decreasing = TRUE)
 # provided order for nodes
 new_order = c("vin", "biere", "cidre", "fromage", "foie", "pain")
 arcplot(un_graphe, ordering = new_order)


 # generate graphs
 ring_graph = graph.ring(10)
 star_graph = graph.star(10, mode="out")
 tree_graph = graph.tree(10, 2)

 # add names to nodes
 V(ring_graph)$name = letters[1:vcount(ring_graph)]
 V(star_graph)$name = paste("Node", 1:vcount(star_graph))
 V(tree_graph)$name = paste("V", 1:vcount(tree_graph), sep='')

 # extract edgelist
 ring_edges = get.edgelist(ring_graph)
 star_edges = get.edgelist(star_graph)
 tree_edges = get.edgelist(tree_graph)

 # arc diagram
 arcplot(ring_edges, labels=V(ring_graph)$name, las=1)
 arcplot(star_edges, labels=V(star_graph)$name, las=2)
 arcplot(tree_edges, labels=V(tree_graph)$name, las=2)

 # compare to plot.igraph
 plot(ring_graph, vertex.label=V(ring_graph)$name)
 plot(star_graph, vertex.label=V(star_graph)$name)
 plot(tree_graph, vertex.label=V(tree_graph)$name)
 }
}
\author{
  Gaston Sanchez
}
\seealso{
  \code{\link{xynodes}}
}

