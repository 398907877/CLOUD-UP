package org.jeecgframework.web.bet.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import org.jeecgframework.web.system.pojo.base.TSUser;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 注单
 * @author zhangdaihao
 * @date 2016-12-15 13:21:14
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_bet_order", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class BetOrderEntity implements java.io.Serializable {
	/**主键id*/
	private java.lang.Integer id;
	/**第几期*/
	private java.lang.String phase;
	/**类型 跟玩法对应 */
	private java.lang.String type;
	/**玩法 1赛车排名*/
	private java.lang.String game;
	/**赔率*/
	private BigDecimal odds;
	/**押注额*/
	private BigDecimal amount;
	/**押注对象*/
	private java.lang.String target;
	/**可赢额*/
	private BigDecimal winamount;
	/**状态*/
	private java.lang.String state;
	/**结果*/
	private BigDecimal result;
	/**结果类型 0输 1赢*/
	private java.lang.String resulttype;
	/**createtime*/
	private java.util.Date createtime;
	/**userid*/
	private TSUser user;
	private java.lang.String username;
	
	@Column(name ="USERNAME",nullable=true,length=32)
	public java.lang.String getUsername() {
        return username;
    }

    public void setUsername(java.lang.String username) {
        this.username = username;
    }

    /**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  主键id
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  主键id
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  第几期
	 */
	@Column(name ="PHASE",nullable=true,length=14)
	public java.lang.String getPhase(){
		return this.phase;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  第几期
	 */
	public void setPhase(java.lang.String phase){
		this.phase = phase;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类型 跟玩法对应 
	 */
	@Column(name ="TYPE",nullable=true,length=6)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类型 跟玩法对应 
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  玩法 1赛车排名
	 */
	@Column(name ="GAME",nullable=true,length=6)
	public java.lang.String getGame(){
		return this.game;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  玩法 1赛车排名
	 */
	public void setGame(java.lang.String game){
		this.game = game;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  赔率
	 */
	@Column(name ="ODDS",nullable=true,precision=12,scale=2)
	public BigDecimal getOdds(){
		return this.odds;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  赔率
	 */
	public void setOdds(BigDecimal odds){
		this.odds = odds;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  押注额
	 */
	@Column(name ="AMOUNT",nullable=true,precision=12,scale=2)
	public BigDecimal getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  押注额
	 */
	public void setAmount(BigDecimal amount){
		this.amount = amount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  押注对象
	 */
	@Column(name ="TARGET",nullable=true,length=12)
	public java.lang.String getTarget(){
		return this.target;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  押注对象
	 */
	public void setTarget(java.lang.String target){
		this.target = target;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  可赢额
	 */
	@Column(name ="WINAMOUNT",nullable=true,precision=12,scale=2)
	public BigDecimal getWinamount(){
		return this.winamount;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  可赢额
	 */
	public void setWinamount(BigDecimal winamount){
		this.winamount = winamount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="STATE",nullable=true,length=2)
	public java.lang.String getState(){
		return this.state;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setState(java.lang.String state){
		this.state = state;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  结果
	 */
	@Column(name ="RESULT",nullable=true,precision=13,scale=0)
	public BigDecimal getResult(){
		return this.result;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  结果
	 */
	public void setResult(BigDecimal result){
		this.result = result;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  结果类型 0输 1赢
	 */
	@Column(name ="RESULTTYPE",nullable=true,length=2)
	public java.lang.String getResulttype(){
		return this.resulttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  结果类型 0输 1赢
	 */
	public void setResulttype(java.lang.String resulttype){
		this.resulttype = resulttype;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  createtime
	 */
	@Column(name ="CREATETIME",nullable=true)
	public java.util.Date getCreatetime(){
		return this.createtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  createtime
	 */
	public void setCreatetime(java.util.Date createtime){
		this.createtime = createtime;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  userid
	 */
	@ManyToOne
	@JoinColumn(name="USERID",nullable=false)
	public TSUser getUser(){
		return this.user;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  userid
	 */
	public void setUser(TSUser user){
		this.user = user;
	}
}
