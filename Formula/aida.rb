class Aida < Formula
  desc "Run Spark applications in the Cloud from the command line"
  homepage "https://www.aidalabs.io/docs"
  url "https://cdn.aidalabs.info/aida-v0.0.9.tar.gz"
  sha256 "f6497b42792f171683f2052749de5b77a0de00582c59c6193acee126d8352661"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    inreplace "bin/aida", /^CLIENT_HOME=/, "export AIDA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/aida"

    # system "./configure", "--disable-debug",
    #                       "--disable-dependency-tracking",
    #                       "--disable-silent-rules",
    #                       "--prefix=#{prefix}"
    # # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system bin/"aida", "version"
  end
end
