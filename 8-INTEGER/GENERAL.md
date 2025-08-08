# Int Darstellung

## Problemdarstellung: 
LLVM speichert integer in Bit-Darstellung. Das heißt wir müssen auch in Boogie die so speichern, damit es keine Datenverluste gibt.
1. unsigned (LLVM) - werden ganz normal wieder unsigned (Boogie)
2. signed (LLVM) - das ist die Tricky part, die müssen auch als unsigned gespeichert werden. Zb. -5 wird 251 (wenn man i8 hat)

---

## Fall 1 - unsigned positiv
nur die mod 2^n rechnen, wobei die n iN ist:

x := x mod 2^n

## Fall 2 - signed negativ
Erstmal in unsigned übersetzen und danach benutzen

x := x + 2^N solange x auch in iN Grenzen bleibt

## Fall - rest
Bei Rest muss man nicht wirklich was ändern

## Deklaration
Beim Deklarieren müssen wir feste Grenzen setzen auch bevor wir die Umwandeln..

var x: int;
havoc x;
assume x >= 0;
assume x < 2^N;

## Operationen
Bei ADD, MUL und SUB müssen wir nicht viel machen, nur Operationen durchführen und mit mod kontrollieren

### add
x := (x + y) % 2^N;

### sub
x := (x - y) % 2^N;

### mul
x := (x * y) % 2^N;

### Unsigned Operationen - udiv, urem
Da wieder nur die Operationen durchführen und mit mod kontrollieren

### Signed Operationen - sdiv, srem
Hier muss man aufpassen
1. Erstmal die Werte umrechnen: unsigned - signed
2. WENN: x >= 2^n-1, DANN rechne x-2^n
3. Mit signed Werten dei Operation durchführen
4.  WENN: beide (+), DANN nichts
    WENN: erste (-), zweite (+), DANN wie in C umwandeln, div +1 adden und mod den zweiten Op. abziehen
    WENN: erste (+), zweite (-), DANN wie in C umwandeln
    WENN: 
5. Am Ende übersetze die werte nach signed zurück. 
    1. mit temp var
    2. eine funktion am Ende

---

## Optional: toSigned Funktion

```boogie
procedure toSigned(x: int): int {
  if x >= 2^N / 2 then x - 2^N else x
}
```

## Beispiel: sdiv
```boogie
var a, b: int;
havoc a, b;
assume 0 <= a < 2^N;
assume 0 <= b < 2^N;

var sa := toSigned(a);
var sb := toSigned(b);
var sres := sa / sb;
var res := (sres + 2^N) % 2^N;
```

## Beispiel: smod
var a, b: int;
havoc a, b;
assume 0 <= a < 2^N;
assume 0 < b < 2^N;

var sa := toSigned(a);
var sb := toSigned(b);
var srem := sa % sb;
var res := (srem + 2^N) % 2^N;


## Extra Idee: Versgleichsoperatoren mit signed? slt icmp usw
Sollten wir da auch was extra machen?
```boogie
var sa := toSigned(a);
var sb := toSigned(b);
assume sa < sb;
```
