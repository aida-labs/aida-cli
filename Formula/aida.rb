class Aida < Formula
  desc "Run Spark applications in the Cloud from the command line"
  homepage "https://www.aidalabs.io/docs"
  url "https://cdn.aidalabs.info/aida-v0.0.9.tar.gz"
  sha256 "84980117f877ea0cc01cd1a267e99a26c687db60044152b7e960a4227d044c24"
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
