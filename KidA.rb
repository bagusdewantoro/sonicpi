##| Kid A - Radiohead


##| =========== SOUND DEFINITION ===========

define :rhodes1 do |note|
  with_fx :compressor do
    with_fx :flanger, phase_offset: 0.3, mix: 0.01 do
      synth :sine, note: note, attack: 0.1, decay: 0.5, sustain_level: 0.35, release: 0.8, amp: 0.5
      synth :pretty_bell, note: note, amp: 0.02
    end
  end
end

define :piano1 do |note|
  with_fx :reverb do
    synth :beep, note: note, attack: 0.01, decay: 0.5, sustain_level: 0.5, release: 1.4, amp: 0.9
  end
end

define :bass1 do |note|
  with_fx :reverb do
    synth :beep, note: note, attack: 0, decay: 0.5, sustain_level: 0.5, release: 2, amp: 3
  end
end


##| =========== NOTES ===========

pianoNote1 = [
  :bf4, [:d5, :f5, :g5], [:a4, :f5], [:f5, :d6],
  [:a5, :bf5], [:c5, :d5, :bf5], [:f4, :a4, :a5], [:a5, :f6],
  [:e4, :g4], [:g5, :e6], [:g4, :bf4], [:a5, :bf6],
  [:f4, :a4], [:g5, :c6], [:e4, :g4], [:a5, :d6]
].ring

pianoNote2 = [
  :bf4, :r, [:a4, :f5], :r,
  [:d4, :f4], :r, [:f4, :a4, :a5], :r,
  [:e4, :g4], :r, [:g4, :bf4], :r,
  [:f4, :a4], :r, [:e4, :g4], :r
].ring

bassNote1 = [
  [:a2, :f3], [:a2, :f3], :r, [:bf2, :g3], [:bf2, :g3], :r, [:d3, :bf3], [:d3, :bf3],
  :r, [:c3, :a3], [:c3, :a3], :r, :r, :r, :r, :r,
  [:c3, :a3], [:c3, :a3], :r, [:bf2, :g3], [:bf2, :g3], :r, :r, :r,
  :r, :r, :r, :r, :r, :r, :r, :r,
].ring




##| =========== LOOP ===========

use_bpm 110

live_loop :beat do
  16.times do
    play 1, amp: 0
    sleep 1
  end
end


live_loop :pianoIntro do
  piano1 pianoNote2.tick(:one)
  rhodes1 pianoNote1.tick(:two)
  sleep 1
end

with_fx :nrbpf, mix: 0.5, res: 0.5, pre_amp: 1 do
  live_loop :bassIntro, sync: :beat do
    bass1 bassNote1.tick(:three)
    sleep 0.5
  end
end





