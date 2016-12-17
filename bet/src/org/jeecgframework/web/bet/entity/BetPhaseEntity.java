package org.jeecgframework.web.bet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**   
 * @Title: Entity
 * @Description: 开奖结果表
 * @author zhangdaihao
 * @date 2016-12-15 19:25:26
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_bet_phase", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class BetPhaseEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**期数*/
	private java.lang.Integer phase;
	/**结果*/
	private java.lang.String result;
	/**开奖时间*/
	private java.lang.String opentime;
	/**创建时间*/
	private java.util.Date createtime;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  id
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  期数
	 */
	@Column(name ="PHASE",nullable=false,precision=10,scale=0)
	public java.lang.Integer getPhase(){
		return this.phase;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  期数
	 */
	public void setPhase(java.lang.Integer phase){
		this.phase = phase;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  结果
	 */
	@Column(name ="RESULT",nullable=true,length=64)
	public java.lang.String getResult(){
		return this.result;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  结果
	 */
	public void setResult(java.lang.String result){
		this.result = result;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  开奖时间
	 */
	@Column(name ="OPENTIME",nullable=true,length=32)
	public java.lang.String getOpentime(){
		return this.opentime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  开奖时间
	 */
	public void setOpentime(java.lang.String opentime){
		this.opentime = opentime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建时间
	 */
	@Column(name ="CREATETIME",nullable=true)
	public java.util.Date getCreatetime(){
		return this.createtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建时间
	 */
	public void setCreatetime(java.util.Date createtime){
		this.createtime = createtime;
	}
}
