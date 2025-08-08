# Signed DIV und REM

## Fälle
WENN: beide (+), DANN nichts 

WENN: erste (-), zweite (+), DANN wie in C umwandeln, div +1 adden und mod den zweiten Op. abziehen  

WENN: erste (+), zweite (-), DANN wie in C umwandeln, div +1 adden und mod den zweiten Op. abziehen  

WENN: beide (-), DANN wie in C umwandeln, div bleibt positiv, mod bekommt negatives Vorzeichen

## SDIV

### + / +
```boogie
var sdiv: int;
sdiv := a / b;
x := sdiv % 2^N;
```
---
### + / -
```boogie
var sa, sb, sdiv: int;
sa := a;
sb := b - 2^N;          // unsigned to signed falls negativ!

sdiv := sa / sb;
if (sa % sb != 0) {
  sdiv := sdiv + 1;     // in C umwandeln, also +1 auf ergebnis
}
x := (sdiv) % 2^N;      // wieder unsigned?? - idk ob des wieder nötig war ich habe mir aufgeschrieben aber je nachdem
```
---
### - / +

```boogie
var sa, sb, sdiv: int;
sa := a - 2^N;          // unsigned to signed falls negativ!
sb := b;

sdiv := sa / sb;
if (sa % sb != 0) {
  sdiv := sdiv + 1;     // in C umwandeln, also +1 auf ergebnis
}
x := (sdiv) % 2^N;      // wieder unsigned?? - idk ob des wieder nötig war ich habe mir aufgeschrieben aber je nachdem
```

---
### - / -
```boogie
var sa, sb, sdiv: int;
sa := a - 2^N;          // unsigned to signed falls negativ!
sb := b - 2^N;          // unsigned to signed falls negativ!

sdiv := sa / sb;
if (sa % sb != 0) {
  sdiv := sdiv + 1;     // ergebnis muss wieder +1 für C
}
x := (sdiv) % 2^N;
```
---



## SREM

### + / +
```boogie
var a, b, sa, sb, srem: int;

sa := a;
sb := b;

srem := sa % sb;
x := srem % 2^N;
```
---

### + / -
```boogie
var a, b, sa, sb, srem: int;

sa := a;
sb := b - 2^N;                  // b ist negativ als unsigned gespeichert

srem := sa % sb;
srem := srem - sb;              // Ergebnis - 2. Op damit man C Ergebnis hat

x := srem % 2^N;                // x ist endergebnis in unsigned
```
---

### - / +
```boogie
var a, b, sa, sb, srem: int;

sa := a - 2^N;                  // a ist negativ als unsigned gespeichert
sb := b;

srem := sa % sb;
srem := srem - sb;              // Ergebnis - 2. Op damit man C Ergebnis hat

x := srem % 2^N;                // x ist endergebnis in unsigned
```
---

### - / - //bin mir nicht ganz sicher hier
```boogie
var a, b, sa, sb, srem: int;

sa := a - 2^N;
sb := b - 2^N;

srem := sa % sb;
x := (srem) % 2^N;
```
---

## Alternativen 

-   sb := b - 2^N;          // unsigned to signed falls negativ!
    bei sowas kann man direkt zum beispiel:
    sb := (b + 2^(N-1)) % 2^N - 2^(N-1);
    sowas machen und muss dann nicht kontrollieren ob es negativ ist oder nicht aber beide versionen würden funktionieren

-   if else

-   Wann wissen wir ob das negativ ist oder positiv ist