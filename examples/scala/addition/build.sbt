name := "addition"

version := "0.1"

scalaVersion := "2.12.6"

libraryDependencies ++= Seq(
  "org.platanios" %% "tensorflow" % "0.2.3",
  "org.platanios" %% "tensorflow" % "0.2.3" classifier "darwin-cpu-x86_64"
)
