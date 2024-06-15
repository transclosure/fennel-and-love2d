(local CRT (require :src._.cls.CRT))
(var main nil)

(fn love.load [args] 
  (set _G.web? (= :web (. args 1)))
  (love.graphics.setDefaultFilter :nearest :nearest)
  (love.graphics.setFont (love.graphics.newFont 16 :mono))
  (set main (CRT :_ :main))
  (each [e _ (pairs love.handlers)]
    (tset love.handlers e #(main:event e $...))))

(fn love.draw [] (main:draw))

(fn love.update [dt] (main:update dt))
