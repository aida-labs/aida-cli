class Aida < Formula
  desc "Run Spark applications in the Cloud from the command line"
  homepage "https://www.aidalabs.io/docs"
  url "https://cdn.aidalabs.info/aida-v0.0.1.tar.gz"
  sha256 "387a3ed488e2191505e48272a8461e9f77123b31c4996ac88ff21b1a2a4d8084"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    inreplace "bin/aida", /^CLIENT_HOME=/, "export AIDA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system bin/"aida", "version"
  end
end
