// See README.md for license details.

package gcd.tools

import firrtl._
import firrtl.ir._
import firrtl.Mappers._
import firrtl.{options, _}
import firrtl.annotations._
import firrtl.annotations.TargetToken._
import firrtl.ir._
import firrtl.Utils._
import firrtl.Mappers._
import firrtl.PrimOps._
import firrtl.graph.DiGraph
import firrtl.analyses.InstanceKeyGraph
import firrtl.annotations.TargetToken.Ref


class ConstraintPropagation extends Transform {
  val inputForm = LowForm
  val outputForm = HighForm

  def transformStmt(stmt: Statement): Statement = {
    stmt.map(transformExpr)
  }

  
  def simplifyEq(p: DoPrim) : Expression = p.op match {
    case Eq => UIntLiteral( if (p.args == Seq("opcode") && p.consts == Seq(UIntLiteral(2))) 1 else 0, IntWidth(2)) 
    case _ => p
  }


  def transformExpr(e: Expression) : Expression = {
    e match {
      case p: DoPrim => simplifyEq(p)
      case _ => s
    }
  }


  def transformMod(m: DefModule): DefModule = m.map(transformStmt)

  def execute(state: CircuitState): CircuitState = {
    val transformed = state.circuit.map(transformMod)
    state.copy(circuit = transformed)
  }
}
