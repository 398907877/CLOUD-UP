package org.jeecgframework.web.bet.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.web.system.pojo.base.TSTypegroup;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 积分流水
 * @author zhangdaihao
 * @date 2016-12-15 20:52:44
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_point_detail", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class PointDetailEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**用户id*/
	private java.lang.String userid;
	/**创建时间*/
	private java.util.Date createtime;
	/**流水类型  0充值 1投注*/
	private java.lang.String type;
	/**积分*/
	private BigDecimal amount;
	/**createuserid*/
	private java.lang.String createuserid;
	/**createuser*/
	private java.lang.String createuser;
	
	private BetOrderEntity betOrder;
	
	@OneToOne
    @JoinColumn(name = "orderid")
	public BetOrderEntity getBetOrder() {
        return betOrder;
    }

    public void setBetOrder(BetOrderEntity betOrder) {
        this.betOrder = betOrder;
    }

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
	 *@return: java.lang.Integer  用户id
	 */
	@Column(name ="USERID",nullable=false,precision=10,scale=0)
	public java.lang.String getUserid(){
		return this.userid;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  用户id
	 */
	public void setUserid(java.lang.String userid){
		this.userid = userid;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  流水类型  0充值 1投注
	 */
	@Column(name ="TYPE",nullable=true,length=2)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  流水类型  0充值 1投注
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  积分
	 */
	@Column(name ="AMOUNT",nullable=true,precision=10,scale=0)
	public BigDecimal getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  积分
	 */
	public void setAmount(BigDecimal amount){
		this.amount = amount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  createuserid
	 */
	@Column(name ="CREATEUSERID",nullable=true,length=32)
	public java.lang.String getCreateuserid(){
		return this.createuserid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  createuserid
	 */
	public void setCreateuserid(java.lang.String createuserid){
		this.createuserid = createuserid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  createuser
	 */
	@Column(name ="CREATEUSER",nullable=true,length=255)
	public java.lang.String getCreateuser(){
		return this.createuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  createuser
	 */
	public void setCreateuser(java.lang.String createuser){
		this.createuser = createuser;
	}
}
