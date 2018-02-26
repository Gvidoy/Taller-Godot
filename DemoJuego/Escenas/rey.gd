extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocidad = 100.0
var vel = Vector2(0.0, 0.0)
var g = 3.0

var on_floor = false
var salto = 170.0

func _ready():
 # Called every time the node is added to the scene.
 # Initialization here
 pass

func _physics_process(delta):
# # Called every frame. Delta is time since last frame.
# # Update game logic here.
 vel.y +=g
 on_floor = is_on_floor()
 if(is_on_floor()):
  vel.y = 0.0
 if (Input.is_key_pressed(KEY_RIGHT)):
  change_anim("walk")
  $Sprite.flip_h = false
  vel.x = velocidad
  
 elif(Input.is_key_pressed(KEY_LEFT)):
  change_anim("walk")
  $Sprite.flip_h = true
  vel.x = -velocidad
 
 else:
  $anim.stop(true)
  vel.x = 0.0
  
 if(Input.is_key_pressed(KEY_UP) and on_floor):
  
  vel.y = -salto
 move_and_slide(vel,Vector2(0.0,-1.0))
 
func change_anim(new_anim):
 if(new_anim != $anim.current_animation):
  $anim.play(new_anim)
 
