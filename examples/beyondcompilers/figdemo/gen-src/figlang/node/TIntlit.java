/* This file was generated by SableCC (http://www.sablecc.org/). */

package figlang.node;

import figlang.analysis.*;

@SuppressWarnings("nls")
public final class TIntlit extends Token
{
    public TIntlit(String text)
    {
        setText(text);
    }

    public TIntlit(String text, int line, int pos)
    {
        setText(text);
        setLine(line);
        setPos(pos);
    }

    @Override
    public Object clone()
    {
      return new TIntlit(getText(), getLine(), getPos());
    }

    public void apply(Switch sw)
    {
        ((Analysis) sw).caseTIntlit(this);
    }
}
