(local Object (require "lib.classic"))
(local Cartridge (Object:extend))

(tset Cartridge :new (fn [self old]
  (when old
    (each [k v (pairs old)]
      (tset self k v)))
  self))

(tset Cartridge :callback (fn [self callback] 
  (tset self :cb callback)))

(tset Cartridge :load (fn [oldcart name]
  (let [newcart (oldcart.cb name oldcart)]
    (newcart.callback newcart oldcart.cb))))

(tset Cartridge :update (fn [self dt w h] ))

(tset Cartridge :draw (fn [self w h] (fn [])))

Cartridge
