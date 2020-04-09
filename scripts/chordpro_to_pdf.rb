#! /usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'

SONGS_DIRECTORY = 'songs'
OUTPUT_DIRECTORY = 'build'

def run(command)
  return if system(command)

  error_message = "Command #{command} failed"
  raise error_message
end

FileUtils.mkdir_p(OUTPUT_DIRECTORY)

songs_files = File.join('**', '*.cho')
Dir.glob(songs_files).each do |song_file|
  puts song_file
  song_basename = File.basename(song_file, '.cho')

  command = "chordpro #{song_file} -o #{OUTPUT_DIRECTORY}/#{song_basename}.pdf"
  puts command
  run(command)
end
