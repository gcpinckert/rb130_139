=begin
Given: a listening device
- listens for something (represented by a block)
- if anything is said (a block given)
  - records it for later use
- if nothing is said (no block given)
  - do not record anything
- can output the most recent recording with the Device#play method

Device#listen method
- takes an optional block
- records the return value of the block with the Device#record method
- need to have an explicit block to pass it to another method?

Device#play method
Should output the most recent recording, ie last element in @recordings
Does not modify the @recordings array?
=end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings[-1]
  end
end

listener = Device.new
listener.listen { "Hello World!"}
listener.listen
listener.play
# Outputs: "Hello World!"