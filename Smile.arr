use context essentials2021
fun Smile(Circle1, Circle2, Circle3, Circle4, Square5, Square6, Triangle7, Triangle8, Background):
  overlay-xy(circle(5, "solid", Circle1), -47, -20,
    overlay-xy(circle(5, "solid", Circle2), -17, -20,
      overlay-xy(circle(10, "solid", Circle3), -43, -12,
        overlay-xy(circle(10, "solid", Circle4), -13, -12,
          overlay-xy(rectangle(10, 10, "solid", Square5), -55, -60, 
            overlay-xy(rectangle(10, 10, "solid", Square6), -35, -60,
              overlay-xy(triangle-sas(25, 30, 20, "solid", Triangle7), -35, -40,
                overlay-xy(rectangle(40, 20, "solid", Triangle8), -30, -60,
                  rectangle(100, 100, "solid", Background)))))))))

end

Smile("red", "red", "black", "black", "white", "white", "purple", "purple", "grey")



