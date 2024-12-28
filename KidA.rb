use_bpm 113

define :tempo do
  play :f5
  sleep 1
end

define :piano do
  use_synth :beep
  play_pattern_timed [:bb4, :d5, :f5, :d6], 1
end

in_thread(name: :threadPiano) do
  piano
end

