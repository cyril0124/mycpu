// import Mill dependency
import mill._
import scalalib._
import scalafmt._

// support BSP
import mill.bsp._

/** https://com-lihaoyi.github.io/mill/mill/Configuration.html */

val defaultVersions = Map(
  "chisel3" -> "3.5.5",
  "chisel3-plugin" -> "3.5.5",
  "chiseltest" -> "0.5.5",
  "scala" -> "2.12.17",
  "scalatest" -> "3.2.2"
)

def getVersion(dep: String, org: String = "edu.berkeley.cs", cross: Boolean = false) = {
  val version = sys.env.getOrElse(dep + "Version", defaultVersions(dep))
  if (cross)
    ivy"$org:::$dep:$version"
  else
    ivy"$org::$dep:$version"
}

trait CommonModule extends ScalaModule {
  override def scalaVersion = defaultVersions("scala")

  /** You can pass flags to the Scala compiler via @scalacOptions. */
  override def scalacOptions = Seq(
    "-language:reflectiveCalls",
    "-deprecation",
    "-feature",
    "-Xcheckinit",
    "-P:chiselplugin:genBundleElements"
  )

  val macroParadise = ivy"org.scalamacros:::paradise:2.1.1"

  override def compileIvyDeps = Agg(macroParadise)

  /** You can use Scala compiler plugins by setting scalacPluginIvyDeps. */
  override def scalacPluginIvyDeps = Agg(macroParadise, getVersion("chisel3-plugin", cross = true))
}

object MyCPU extends SbtModule with ScalafmtModule with CommonModule {

  override def moduleDeps = super.moduleDeps
  override def millSourcePath = os.pwd
  
  /**
    * You can define the @ivyDeps field to add ivy dependencies to your module. 
    * https://com-lihaoyi.github.io/mill/mill/Library_Dependencies.html
    */
  override def ivyDeps = super.ivyDeps() ++ Agg(
    getVersion("chisel3"),
    getVersion("chiseltest"),
  )
  
  // object RegFileTest extends Tests {

  //   override def ivyDeps = super.ivyDeps() ++ Agg(
  //     getVersion("scalatest", "org.scalatest")
  //   )

  //   def testFrameworks = Seq("org.scalatest.tools.Framework")

  // }

  object test extends Tests {

    override def ivyDeps = super.ivyDeps() ++ Agg(
      getVersion("scalatest", "org.scalatest")
    )

    def testFrameworks = Seq("org.scalatest.tools.Framework")

  }


}
