class Aida < Formula
  desc "Run Spark applications in the Cloud from the command line"
  homepage "https://www.aidalabs.io/docs"
  url "https://cdn.aidalabs.info/aida-v0.0.10.tar.gz"
  sha256 "9aa83e3a877b5a83cf03434b792bbc13c26785c6bedd195db7deea2a8d95afaa"
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
