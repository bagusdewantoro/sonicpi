##| Kid A - Radiohead

use_bpm 110

master_volume = 1


# Change the values to "1" to activate

amp_bell = master_volume * 1

amp_piano = master_volume * 1

##| if amp_bell == 0; amp_piano = master_volume * 1
##| else amp_piano = master_volume * 0
##| end

amp_bass_drum = master_volume * 1

amp_heli = master_volume * 1

amp_thom = master_volume * 0.8




##| =========== SOUND DEFINITION ====================================================================


define :rhodes1 do |noteRhodes, notePiano, slp = 1|
  with_fx :compressor do
    with_fx :flanger, phase_offset: 0.3, mix: 0.01 do
      synth :sine, note: noteRhodes, attack: 0.1, decay: 0.5, sustain_level: 0.35, release: 0.8, amp: (0.45*amp_piano)
      synth :pretty_bell, note: noteRhodes, amp: (0.07*amp_piano)
    end
  end
  with_fx :reverb do
    synth :beep, note: notePiano, attack: 0.01, decay: 0.5, sustain_level: 0.5, release: 1.4, amp: (0.7*amp_piano)
  end
  sleep slp
end


define :marimba do |note|
  with_fx :compressor do
    with_fx :echo, phase: 0.5, mix: 0.5, pre_amp: 2.0, release: 7 do
      synth :beep, note: note, attack: 0, decay: 0.5, sustain_level: 1, release: 1, amp: (1.5*amp_bass_drum)
    end
  end
  sleep 0.5
end

define :drumBass do |slp1=1, slp2=1|
  sample :bd_ada, amp: (0.7*amp_bass_drum) , release: 0
  sleep slp1
  sample :bd_ada, amp: (0.7*amp_bass_drum) , release: 0
  sample :bd_sone, amp: (0.5*amp_bass_drum) , release: 0
  sleep slp2
end

define :drumTom do |slp=1|
  sample :bd_haus, rate: 1.5 , amp: rrand((1.0*amp_bass_drum), (1.2*amp_bass_drum)), lpf: rrand(65, 75)
  sleep slp
end

define :thom do |n=60, a=1, s=1|
  with_fx :gverb, mix: 1 do
    with_fx :bpf, mix: 0.5 do
      synth :saw, note: n, attack: 0.4*s, release: 0.7*s, amp: 0.25*a*amp_thom
      synth :tri, note: n, attack: 0.4*s, release: 1.0*s, amp: 0.45*a*amp_thom
      ##| synth :beep, note: n, attack: 0.35*s, release: 1.01*s, amp: 1.5*a
    end
  end
  sleep s
end



##| =========== NOTES ===============================================================================


pianoNote1 = [
  :bf4, [:d5, :f5, :g5], [:a4, :f5], [:f5, :d6],
  [:a5, :bf5], [:c5, :d5, :bf5], [:f4, :a4, :a5], [:a5, :f6],
  [:e5, :g5], [:g5, :e6], [:g5, :bf5], [:a5, :bf6],
  [:f5, :a5], [:g5, :c6], [:e4, :g4], [:a5, :d6]
].ring

pianoNote2 = [
  :bf4, :r, [:a4, :f5], :r,
  [:d4, :f4], :r, [:f4, :a4, :a5], :r,
  [:e4, :g4], :r, [:g4, :bf4], :r,
  [:f4, :a4], :r, [:e4, :g4], :r
].ring

pianoSleep = [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5
].ring

bassNote1 = [
  [:a2, :f3], [:a2, :f3], :r, [:bf2, :g3], [:bf2, :g3], :r, [:d3, :bf3], [:d3, :bf3],
  :r, [:c3, :a3], [:c3, :a3], :r, :r, :r, :r, :r,
  [:c3, :a3], [:c3, :a3], :r, [:bf2, :g3], [:bf2, :g3], :r, :r, :r,
  :r, :r, :r, :r, :r, :r, :r,
].ring

bassDrumSleep = [
  1, 1, 1, 0.5
].ring

drumTomSleep = [
  1, 1, 0.5, 0.75, 0.25, 0.5,        1.25, 0.25, 0.5, 0.5, 0.75, 0.25, 0.5,       # 8 beat
  0.5, 0.25, 0.5, 0.25, 0.5,         1.75, 0.25, (4.to_f/6), (4.to_f/6), (1.to_f/6), (3.to_f/6), # 8 beat
  1, 1, 0.5, 0.75, 0.25, 0.5,        1.25, 0.25, 0.5, 0.5, 0.75, 0.25, 0.5,       # 8 beat
  (2.to_f/3), (2.to_f/3), (2.to_f/3),   1.75, 0.25, (4.to_f/6), (4.to_f/6), (2.to_f/6), # 7.666 beat
].ring

thomNote = [
  :c4, :c4, :a3, :d4, :g4, :r,
  :bf3, :bf3, :a3, :bf3, :c4, :c4,
].ring

thomAmp = [
  1, 0.75, 0.3, 0.65, 0.35,
  0.4, 0.75, 0.35, 0.5, 0.3,
].ring

thomSleep = [
  1.25, 0.9, 3.85, 1.8, 5, 4,
  1.15, 0.85, 1, 1.2, 1, 4.8
].ring







##| ===================================================================================================
##| ===================================================================================================
##| =========== LOOP ====== LOOP ======================================================================
##| ===================================================================================================
##| ===================================================================================================





live_loop :metronome do
  8.times do
    ##| synth :beep, note: 67
    sleep 0.5
  end
end


in_thread(name: :Helicopter) do
  stop
  1.times do
    rate_values1 = (line 15, 8, steps: 40) + (line 8, 10, steps: 20) + (line 10, 14, steps: 28)
    rate_values2 = (line 10, 15, steps: 24)
    rate_values3 = (line 14, 23, steps: 15)
    with_fx :gverb, mix: 0.9 do
      with_fx :echo, phase: 0.2, mix: 1 do
        rate_values1.each do |rate|
          sample :bd_pure, amp: 0.2 * amp_heli, rate: rate
          sleep 0.3
        end
        sleep 5
        rate_values2.each do |rate|
          sample :bd_pure, amp: 0.2 * amp_heli, rate: rate
          sleep 0.3
        end
        sleep 2
        rate_values3.each do |rate|
          sample :bd_pure, amp: 0.1 * amp_heli, rate: rate
          sleep 0.10
        end
        sleep 2
        rate_values3.each do |rate|
          sample :bd_pure, amp: 0.04 * amp_heli, rate: (rate*1.2)
          sleep 0.07
        end
      end
    end
  end
end

in_thread(name: :bellIntro) do
  stop
  sync :metronome
  1.times do
    amp_values = (line 0.02, 0.6, steps: 10) + (line 0.6, 0.5, steps: 6)
    with_fx :flanger, phase_offset: 0.3, mix: 0.2 do
      amp_values.each do |amp|
        synth :sine, note: :d6, amp: (amp*amp_bell)
        sleep 1
      end
    end
  end
end

in_thread(name: :bellEnd) do
  stop
  sync :metronome
  end_values = (line 0.5, 2, steps: 3)
  sleep 12.7
  end_values.each do |amp|
    sample :drum_cymbal_closed, amp: (amp*amp_bell), attack: 0, rate: -1
    sleep 1
  end
  sleep 0.3
end

live_loop :pianoIntro do
  ##| stop
  sync :metronome
  pianoNote2.length().times do
    rhodes1 pianoNote1.tick(:one), pianoNote2.tick(:two), pianoSleep.tick(:pS)
  end
  
end

live_loop :bassIntro do
  ##| stop
  sync :metronome
  bassNote1.length().times do
    marimba bassNote1.tick(:three)
  end
end

live_loop :bassDrum1 do
  ##| stop
  sync :metronome
  4.times do
    drumBass 1, bassDrumSleep.tick(:bd)
  end
end

live_loop :tomDrum do
  ##| stop
  sync :metronome
  drumTomSleep.length().times do
    drumTom drumTomSleep.tick(:four)
  end
end


in_thread(name: :thomSing) do
  ##| stop
  sync :metronome
  thomNote.length().times do
    thom thomNote.tick(:tN), thomAmp.tick(:tA), thomSleep.tick(:tS)
  end
end






##| ================ TEST ==============================================================================


##| ##| Sample Test
##| with_fx :tremolo, phase: 0.2, mix: 0.5 do
##|   live_loop :testSample, rate: -1 do
##|     ##| sample :misc_cineboom
##|     rhodes1 90
##|     sleep 1
##|   end
##| end

##| ##| Syth Test
##| live_loop :testSynth do
##|   use_synth :tri

##|   s = play :f3, release: 2, note_slide: 2
##|   sleep 0.5
##|   control s, note: :g3
##|   sleep 0.5
##|   s = play :g3, release: 1, note_slide: 2
##|   sleep 1

##|   s = play :a3, release: 2, note_slide: 2
##|   sleep 0.5
##|   control s, note: :bf3
##|   sleep 0.5
##|   s = play :bf3, release: 1, note_slide: 2
##|   sleep 1
##| end


##| ##| Sliding notes
##| s = play 60, release: 5, note_slide: 1
##| sleep 0.5
##| control s, note: 65
##| sleep 0.5
##| control s, note: 67
##| sleep 3
##| control s, note: 72

