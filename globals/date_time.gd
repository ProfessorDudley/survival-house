extends Timer

var _tick_rate: float = 0.1
var _elapsed_seconds: int
var _timescale: Dictionary[StringName, int] = {
	&"hours": 24,
	&"minutes": 10,
	&"seconds": 10,
}

var seconds: int = 0:
	get:
		@warning_ignore("integer_division")
		return floori(_elapsed_seconds % _timescale[&"seconds"])
var minutes: int = 0:
	get:
		@warning_ignore("integer_division")
		return floori(_elapsed_seconds / _timescale[&"seconds"] % _timescale[&"seconds"])
var hours: int = 0:
	get:
		@warning_ignore("integer_division")
		return floori(_elapsed_seconds / _timescale[&"minutes"] / _timescale[&"seconds"] % _timescale[&"seconds"])

func _init() -> void:
	wait_time = _tick_rate
	autostart = true
	timeout.connect(_on_timer_timeout)
	_print_time()

func _on_timer_timeout():
	_elapsed_seconds+=1
	_print_time()
	
func _print_time() -> void:
	print("%6.0f Elapsed, Hours: %02.0f, Minutes: %2.0f, Seconds: %2.0f\n" % [_elapsed_seconds, hours, minutes, seconds])

	
