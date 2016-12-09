# 1: Use ruby 2.3.3 as base:
FROM ruby:2.3.3

# 2: We'll set this gem path as the working directory
WORKDIR /usr/src/lib

# 3: We'll set the working dir as HOME and add the app's binaries path to $PATH:
ENV HOME=/usr/src/lib PATH=/usr/src/lib/bin:$PATH

# 4: Set the default command:
CMD ["guard"]
