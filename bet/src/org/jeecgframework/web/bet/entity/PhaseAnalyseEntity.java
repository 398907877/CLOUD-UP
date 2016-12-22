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
 * @Description: 每期结果分析
 * @author zhangdaihao
 * @date 2016-12-22 12:47:37
 * @version V1.0   
 *
 */
@Entity
@Table(name = "t_phase_analyse", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class PhaseAnalyseEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**phase*/
	private java.lang.Integer phase;
	/**opentime*/
	private java.util.Date opentime;
	/**ranking1*/
	private java.lang.String ranking1;
	/**ranking2*/
	private java.lang.String ranking2;
	/**ranking3*/
	private java.lang.String ranking3;
	/**ranking4*/
	private java.lang.String ranking4;
	/**ranking5*/
	private java.lang.String ranking5;
	/**ranking6*/
	private java.lang.String ranking6;
	/**ranking7*/
	private java.lang.String ranking7;
	/**ranking8*/
	private java.lang.String ranking8;
	/**ranking9*/
	private java.lang.String ranking9;
	/**ranking10*/
	private java.lang.String ranking10;
	/**冠亚和*/
	private java.lang.String top2;
	/**单双*/
	private java.lang.String top2d;
	/**大小*/
	private java.lang.String top2b;
	/**ranking1lh*/
	private java.lang.String ranking1lh;
	/**ranking2lh*/
	private java.lang.String ranking2lh;
	/**ranking3lh*/
	private java.lang.String ranking3lh;
	/**ranking4lh*/
	private java.lang.String ranking4lh;
	/**ranking5lh*/
	private java.lang.String ranking5lh;
	
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
	 *@return: java.lang.Integer  phase
	 */
	@Column(name ="PHASE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getPhase(){
		return this.phase;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  phase
	 */
	public void setPhase(java.lang.Integer phase){
		this.phase = phase;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  opentime
	 */
	@Column(name ="OPENTIME",nullable=true)
	public java.util.Date getOpentime(){
		return this.opentime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  opentime
	 */
	public void setOpentime(java.util.Date opentime){
		this.opentime = opentime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking1
	 */
	@Column(name ="RANKING1",nullable=true,length=4)
	public java.lang.String getRanking1(){
		return this.ranking1;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking1
	 */
	public void setRanking1(java.lang.String ranking1){
		this.ranking1 = ranking1;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking2
	 */
	@Column(name ="RANKING2",nullable=true,length=4)
	public java.lang.String getRanking2(){
		return this.ranking2;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking2
	 */
	public void setRanking2(java.lang.String ranking2){
		this.ranking2 = ranking2;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking3
	 */
	@Column(name ="RANKING3",nullable=true,length=4)
	public java.lang.String getRanking3(){
		return this.ranking3;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking3
	 */
	public void setRanking3(java.lang.String ranking3){
		this.ranking3 = ranking3;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking4
	 */
	@Column(name ="RANKING4",nullable=true,length=4)
	public java.lang.String getRanking4(){
		return this.ranking4;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking4
	 */
	public void setRanking4(java.lang.String ranking4){
		this.ranking4 = ranking4;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking5
	 */
	@Column(name ="RANKING5",nullable=true,length=4)
	public java.lang.String getRanking5(){
		return this.ranking5;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking5
	 */
	public void setRanking5(java.lang.String ranking5){
		this.ranking5 = ranking5;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking6
	 */
	@Column(name ="RANKING6",nullable=true,length=4)
	public java.lang.String getRanking6(){
		return this.ranking6;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking6
	 */
	public void setRanking6(java.lang.String ranking6){
		this.ranking6 = ranking6;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking7
	 */
	@Column(name ="RANKING7",nullable=true,length=4)
	public java.lang.String getRanking7(){
		return this.ranking7;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking7
	 */
	public void setRanking7(java.lang.String ranking7){
		this.ranking7 = ranking7;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking8
	 */
	@Column(name ="RANKING8",nullable=true,length=4)
	public java.lang.String getRanking8(){
		return this.ranking8;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking8
	 */
	public void setRanking8(java.lang.String ranking8){
		this.ranking8 = ranking8;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking9
	 */
	@Column(name ="RANKING9",nullable=true,length=4)
	public java.lang.String getRanking9(){
		return this.ranking9;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking9
	 */
	public void setRanking9(java.lang.String ranking9){
		this.ranking9 = ranking9;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking10
	 */
	@Column(name ="RANKING10",nullable=true,length=4)
	public java.lang.String getRanking10(){
		return this.ranking10;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking10
	 */
	public void setRanking10(java.lang.String ranking10){
		this.ranking10 = ranking10;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  冠亚和
	 */
	@Column(name ="TOP2",nullable=true,length=4)
	public java.lang.String getTop2(){
		return this.top2;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  冠亚和
	 */
	public void setTop2(java.lang.String top2){
		this.top2 = top2;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  单双
	 */
	@Column(name ="TOP2D",nullable=true,length=4)
	public java.lang.String getTop2d(){
		return this.top2d;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  单双
	 */
	public void setTop2d(java.lang.String top2d){
		this.top2d = top2d;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  大小
	 */
	@Column(name ="TOP2B",nullable=true,length=4)
	public java.lang.String getTop2b(){
		return this.top2b;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  大小
	 */
	public void setTop2b(java.lang.String top2b){
		this.top2b = top2b;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking1lh
	 */
	@Column(name ="RANKING1LH",nullable=true,length=4)
	public java.lang.String getRanking1lh(){
		return this.ranking1lh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking1lh
	 */
	public void setRanking1lh(java.lang.String ranking1lh){
		this.ranking1lh = ranking1lh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking2lh
	 */
	@Column(name ="RANKING2LH",nullable=true,length=4)
	public java.lang.String getRanking2lh(){
		return this.ranking2lh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking2lh
	 */
	public void setRanking2lh(java.lang.String ranking2lh){
		this.ranking2lh = ranking2lh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking3lh
	 */
	@Column(name ="RANKING3LH",nullable=true,length=4)
	public java.lang.String getRanking3lh(){
		return this.ranking3lh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking3lh
	 */
	public void setRanking3lh(java.lang.String ranking3lh){
		this.ranking3lh = ranking3lh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking4lh
	 */
	@Column(name ="RANKING4LH",nullable=true,length=4)
	public java.lang.String getRanking4lh(){
		return this.ranking4lh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking4lh
	 */
	public void setRanking4lh(java.lang.String ranking4lh){
		this.ranking4lh = ranking4lh;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  ranking5lh
	 */
	@Column(name ="RANKING5LH",nullable=true,length=4)
	public java.lang.String getRanking5lh(){
		return this.ranking5lh;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  ranking5lh
	 */
	public void setRanking5lh(java.lang.String ranking5lh){
		this.ranking5lh = ranking5lh;
	}
}
