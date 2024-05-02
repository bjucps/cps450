/* This file was generated by SableCC (http://www.sablecc.org/). */

package figlang.analysis;

import figlang.node.*;

public interface Analysis extends Switch
{
    Object getIn(Node node);
    void setIn(Node node, Object o);
    Object getOut(Node node);
    void setOut(Node node, Object o);

    void caseStart(Start node);
    void caseAStart(AStart node);
    void caseAFigure(AFigure node);
    void caseACommaAttrList(ACommaAttrList node);
    void caseASingleAttrList(ASingleAttrList node);
    void caseAAttribute(AAttribute node);
    void caseAIntLiteral(AIntLiteral node);
    void caseAStrLiteral(AStrLiteral node);

    void caseTLBracket(TLBracket node);
    void caseTRBracket(TRBracket node);
    void caseTComma(TComma node);
    void caseTColon(TColon node);
    void caseTId(TId node);
    void caseTIntlit(TIntlit node);
    void caseTStrlit(TStrlit node);
    void caseTEol(TEol node);
    void caseTBlank(TBlank node);
    void caseEOF(EOF node);
}