module type Board = sig
  type position
  type piece_type = Pawn | Knight | Bishop | Rook | Queen | King
  type piece = Black of piece_type | White of piece_type
  type color = piece
  type castle = Queenside | Kingside
  type move = Standard of position * position | Castle of castle
  type board
  exception InvalidPosition

  val init_board : board
 
  val create_pos : int -> int -> position
  
  val pos_to_coord : position -> int * int

  val fen_to_pos : string -> position option

  val fen_decode : string -> board option

  val fen_encode : board -> string

  val to_play : board -> color

  val all_pieces : board -> (position * piece) list

  val play : board -> move -> board option

  val check : board -> bool

  val checkmake : board -> bool
end


let _ = print_endline "Chess."