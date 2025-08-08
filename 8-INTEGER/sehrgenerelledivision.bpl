axiom ( ∀x : int,y: int • {x % y}{x /y} x % y== x−x /y ∗y );
axiom ( ∀x : int,y: int • {x % y}
(0 x ∧ 0 <y ⇒ 0 x % y ∧ x % y <y) ∧
(0 x ∧ y <0 ⇒ 0 x % y ∧ x % y <−y) ∧
(x 0 ∧ 0 <y ⇒ −y <x % y ∧ x % y 0) ∧
(x 0 ∧ y <0 ⇒ y <x % y ∧ x % y 0) );

procedure main() {
    var a: int;
    var b: int;
    var c: int;
    var x: int;

    var sa: int;
    var sb: int;
    var sdiv: int;
    var srem: int;

    
}