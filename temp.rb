
use_bpm 100

define :synth_list do
  synth_names.each_with_index do |n, i|
    use_synth synth_names[i]
    play_pattern_timed [:bb2, :d3, :f3, :d4, :bb4, :d5, :f5, :d6], 0.25
  end
end

define :synth_choose do |num|
  use_synth synth_names[num]
  play_pattern_timed [:bb2, :d3, :f3, :d4, :bb4, :d5, :f5, :d6], 0.25
end


# Run function below to list and play all synths
# synth_list

# Run function below to test synth by its index
synth_choose 11