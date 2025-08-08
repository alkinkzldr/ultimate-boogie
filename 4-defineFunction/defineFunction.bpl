procedure fail()
{
entry:
    assert false;
    return;
}

procedure main() returns (ret: int)
{
entry:
    call fail();
    ret := 0;
    return;
}
