module Dibujo (encimar,
    -- agregar las funciones constructoras
    ) where


-- nuestro lenguaje 
data Dibujo a = Dibujo Figura | Rotar (Dibujo a) |
                Encimar (Dibujo a) (Dibujo a) deriving (Eq, Show)

data Figura = Triangulo | Rectangulo | Circulo
              | Cuadrado | Linea deriving (Eq, Show)
-- combinadores
infixr 6 ^^^

infixr 7 .-.

infixr 8 ///

comp :: Int -> (a -> a) -> a -> a
comp 0 _ = id
comp n f = f . comp (n-1) f


-- Funciones constructoras
figura :: Figura -> Dibujo a
figura x = Dibujo x

encimar :: Dibujo a -> Dibujo a -> Dibujo a
encimar = Encimar

apilar :: Float -> Float -> Dibujo a -> Dibujo a -> Dibujo a
apilar = undefined

juntar  :: Float -> Float -> Dibujo a -> Dibujo a -> Dibujo a
juntar = undefined

rot45 :: Dibujo a -> Dibujo a
rot45 = Rotar

rotar :: Dibujo a -> Dibujo a
rotar = Rotar


espejar :: Dibujo a -> Dibujo a
espejar = undefined

(^^^) :: Dibujo a -> Dibujo a -> Dibujo a
(^^^) = undefined

(.-.) :: Dibujo a -> Dibujo a -> Dibujo a
(.-.) = undefined

(///) :: Dibujo a -> Dibujo a -> Dibujo a
(///) = undefined

-- rotaciones
r90 :: Dibujo a -> Dibujo a
r90 = comp 2 rot45

r180 :: Dibujo a -> Dibujo a
r180 = comp 2 r90

r270 :: Dibujo a -> Dibujo a
r270 = comp 3 r90

-- una figura repetida con las cuatro rotaciones, superimpuestas.
encimar4 :: Dibujo a -> Dibujo a
encimar4 = undefined

-- cuatro figuras en un cuadrante.
cuarteto :: Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a -> Dibujo a
cuarteto = undefined

-- un cuarteto donde se repite la imagen, rotada (¡No confundir con encimar4!)
ciclar :: Dibujo a -> Dibujo a
ciclar = undefined

-- map para nuestro lenguaje
mapDib :: (a -> b) -> Dibujo a -> Dibujo b
mapDib = undefined
-- verificar que las operaciones satisfagan
-- 1. map figura = id
-- 2. map (g . f) = mapDib g . mapDib f

-- Cambiar todas las básicas de acuerdo a la función.
change :: (a -> Dibujo b) -> Dibujo a -> Dibujo b
change = undefined

-- Principio de recursión para Dibujos.
foldDib ::
  (a -> b) ->
  (b -> b) ->
  (b -> b) ->
  (b -> b) ->
  (Float -> Float -> b -> b -> b) ->
  (Float -> Float -> b -> b -> b) ->
  (b -> b -> b) ->
  Dibujo a ->
  b
foldDib = undefined