(ql:quickload :lispbuilder-sdl-examples)

(defparameter *random-color* sdl:*white*)
;; Create small windows
(sdl:window 200 200 :title-caption "Innaky")

(defun mouse-white-rectangle ()
  "The mouse with a white square below"
  (sdl:window 300 300 :title-caption "Innaky")
  (setf (sdl:frame-rate) 60)
  (sdl:with-events ()
    (:quit-event () t)
    (:key-down-event () (sdl:push-quit-event))
    (:idle ()
	   (sdl:clear-display sdl:*black*)
	   (sdl:draw-box (sdl:rectangle-from-midpoint-*
			   (sdl:mouse-x) (sdl:mouse-y) 20 20)
			  :color sdl:*white*)
	   (sdl:update-display))))

(defun mouse-rectangle-2d ()
  "create a small window whose pointer
has a square and interacts with the left click."
  (sdl:window 300 300 :title-caption "Innaky")
  (setf (sdl:frame-rate) 60)
  (sdl:with-events ()
    (:quit-event () t)
    (:key-down-event ()
		     (sdl:push-quit-event))
    (:idle ()
	   (when (sdl:mouse-left-p)
	     (setf *random-color*
		   (sdl:color :r (random 255) :g (random 255) :b (random 255))))
	   (sdl:clear-display sdl:*white*)
	   (sdl:draw-box (sdl:rectangle-from-midpoint-*
			  (sdl:mouse-x) (sdl:mouse-y) 20 20)
			 :color *random-color*)
	   (sdl:update-display))))
