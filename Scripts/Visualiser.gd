
extends Node2D

# Huge thanks to https://youtu.be/AwgSICbGxJM + https://github.com/Gonkee/Gonkees-Shaders/blob/master/non-shaders/audio_visualiser.gd
# I modified some of it to make it dyanmically put it on the bottom of the screen

onready var spectrum = AudioServer.get_bus_effect_instance(0, 0)
var musicEnabled = true


var definition = 80
# var total_w = 1000 - use screen resolution instead
var total_h = 200
var min_freq = 20
var max_freq = 20000

var max_db = 0
var min_db = -40

var accel = 20
var histogram = []

func _ready():
	max_db += get_parent().volume_db
	min_db += get_parent().volume_db
	
	for i in range(definition):
		histogram.append(0)

func _process(delta):
	var freq = min_freq
	var interval = (max_freq - min_freq) / definition
	
	for i in range(definition):
		
		var freqrange_low = float(freq - min_freq) / float(max_freq - min_freq)
		freqrange_low = freqrange_low * freqrange_low * freqrange_low * freqrange_low
		freqrange_low = lerp(min_freq, max_freq, freqrange_low)
		
		freq += interval
		
		var freqrange_high = float(freq - min_freq) / float(max_freq - min_freq)
		freqrange_high = freqrange_high * freqrange_high * freqrange_high * freqrange_high
		freqrange_high = lerp(min_freq, max_freq, freqrange_high)
		
		var mag = spectrum.get_magnitude_for_frequency_range(freqrange_low, freqrange_high)
		mag = linear2db(mag.length())
		mag = (mag - min_db) / (max_db - min_db)
		
		mag += 0.3 * (freq - min_freq) / (max_freq - min_freq)
		mag = clamp(mag, 0.05, 1)
		
		histogram[i] = lerp(histogram[i], mag, accel * delta)
	
	update()

func _draw():
	# Horizontal Visualiser
	var draw_pos = Vector2(0, 0)
	var screen_height = OS.get_window_size().y
	var screen_width = OS.get_window_size().x
	var w_interval = screen_width / definition
	
	position = Vector2(0, screen_height)
	
	# draw_line(Vector2(0, -total_h), Vector2(screen_width , -total_h), Color.crimson, 2.0, true)
	
	for i in range(definition):
		draw_line(draw_pos, draw_pos + Vector2(0, -histogram[i] * total_h), Color.crimson, 4.0, true)
		draw_pos.x += w_interval
	
	# Round Visualiser
	#var angle = PI
	#var angle_interval = 2 * PI / definition
	#var radius = 50
	#var length = 100
	
	#for i in range(definition):
	#	var normal = Vector2(0, -1).rotated(angle)
	#	var start_pos = normal * radius
	#	var end_pos = normal * (radius + histogram[i] * length)
	#	draw_line(start_pos, end_pos, Color.dodgerblue, 4.0, true)
	#	angle += angle_interval
