/* This file was generated by SableCC (http://www.sablecc.org/). */

package figlang.node;

import figlang.analysis.*;

@SuppressWarnings("nls")
public final class AFigure extends PFigure
{
    private TId _id_;
    private TLBracket _lBracket_;
    private PAttrList _attrList_;
    private TRBracket _rBracket_;

    public AFigure()
    {
        // Constructor
    }

    public AFigure(
        @SuppressWarnings("hiding") TId _id_,
        @SuppressWarnings("hiding") TLBracket _lBracket_,
        @SuppressWarnings("hiding") PAttrList _attrList_,
        @SuppressWarnings("hiding") TRBracket _rBracket_)
    {
        // Constructor
        setId(_id_);

        setLBracket(_lBracket_);

        setAttrList(_attrList_);

        setRBracket(_rBracket_);

    }

    @Override
    public Object clone()
    {
        return new AFigure(
            cloneNode(this._id_),
            cloneNode(this._lBracket_),
            cloneNode(this._attrList_),
            cloneNode(this._rBracket_));
    }

    public void apply(Switch sw)
    {
        ((Analysis) sw).caseAFigure(this);
    }

    public TId getId()
    {
        return this._id_;
    }

    public void setId(TId node)
    {
        if(this._id_ != null)
        {
            this._id_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._id_ = node;
    }

    public TLBracket getLBracket()
    {
        return this._lBracket_;
    }

    public void setLBracket(TLBracket node)
    {
        if(this._lBracket_ != null)
        {
            this._lBracket_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._lBracket_ = node;
    }

    public PAttrList getAttrList()
    {
        return this._attrList_;
    }

    public void setAttrList(PAttrList node)
    {
        if(this._attrList_ != null)
        {
            this._attrList_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._attrList_ = node;
    }

    public TRBracket getRBracket()
    {
        return this._rBracket_;
    }

    public void setRBracket(TRBracket node)
    {
        if(this._rBracket_ != null)
        {
            this._rBracket_.parent(null);
        }

        if(node != null)
        {
            if(node.parent() != null)
            {
                node.parent().removeChild(node);
            }

            node.parent(this);
        }

        this._rBracket_ = node;
    }

    @Override
    public String toString()
    {
        return ""
            + toString(this._id_)
            + toString(this._lBracket_)
            + toString(this._attrList_)
            + toString(this._rBracket_);
    }

    @Override
    void removeChild(@SuppressWarnings("unused") Node child)
    {
        // Remove child
        if(this._id_ == child)
        {
            this._id_ = null;
            return;
        }

        if(this._lBracket_ == child)
        {
            this._lBracket_ = null;
            return;
        }

        if(this._attrList_ == child)
        {
            this._attrList_ = null;
            return;
        }

        if(this._rBracket_ == child)
        {
            this._rBracket_ = null;
            return;
        }

        throw new RuntimeException("Not a child.");
    }

    @Override
    void replaceChild(@SuppressWarnings("unused") Node oldChild, @SuppressWarnings("unused") Node newChild)
    {
        // Replace child
        if(this._id_ == oldChild)
        {
            setId((TId) newChild);
            return;
        }

        if(this._lBracket_ == oldChild)
        {
            setLBracket((TLBracket) newChild);
            return;
        }

        if(this._attrList_ == oldChild)
        {
            setAttrList((PAttrList) newChild);
            return;
        }

        if(this._rBracket_ == oldChild)
        {
            setRBracket((TRBracket) newChild);
            return;
        }

        throw new RuntimeException("Not a child.");
    }
}
