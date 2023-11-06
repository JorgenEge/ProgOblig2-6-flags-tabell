use context essentials2021
fun Nordic_flag(Rectangle1, Rectangle2, Rectangle3, Rectangle4, Background):
  frame(
    overlay-xy(rectangle(400, 25, "solid", Rectangle1), 0, -113,
      overlay-xy(rectangle(25, 250, "solid", Rectangle2), -137, 0,
        overlay-xy(rectangle(50, 250, "solid", Rectangle3), -125, 0,
          overlay-xy(rectangle(400, 50, "solid", Rectangle4), 0, -100,
            rectangle(400, 250, "solid", Background))))))

end

Nordic_flag("blue", "blue", "white", "white", "red")
Nordic_flag("yellow", "yellow", "yellow", "yellow", "blue")
Nordic_flag("red", "red", "white", "white", "darkblue")
Nordic_flag("white", "white","white","white", "red")
Nordic_flag("Darkblue", "Darkblue", "Darkblue", "Darkblue", "white")
Nordic_flag("red", "red", "blue", "blue", "white")
