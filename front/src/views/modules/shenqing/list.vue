<template>
    <div class="main-content">
        <!-- 列表页 -->
        <div v-if="showFlag">
            <el-form :inline="true" :model="searchForm" class="form-content">
                <el-row class="ad" :style="{justifyContent:contents.btnAdAllBoxPosition=='1'?'flex-start':contents.btnAdAllBoxPosition=='2'?'center':'flex-end'}">
                    <el-form-item>
                        <el-button v-if="isAuth('shenqing','新增') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1" type="success" icon="el-icon-plus" @click="addOrUpdateHandler()">{{ contents.btnAdAllFont == 1?'新增':'' }}</el-button>
                        <el-button v-if="isAuth('shenqing','新增') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2" type="success" @click="addOrUpdateHandler()">{{ contents.btnAdAllFont == 1?'新增':'' }}<i class="el-icon-plus el-icon--right" /></el-button>
                        <el-button v-if="isAuth('shenqing','新增') && contents.btnAdAllIcon == 0" type="success" @click="addOrUpdateHandler()">{{ contents.btnAdAllFont == 1?'新增':'' }}</el-button>

                        <el-button v-if="isAuth('shenqing','删除') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1 && contents.tableSelection" :disabled="dataListSelections.length <= 0" type="danger" icon="el-icon-delete" @click="deleteHandler()">{{ contents.btnAdAllFont == 1?'删除':'' }}</el-button>
                        <el-button v-if="isAuth('shenqing','删除') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2 && contents.tableSelection" :disabled="dataListSelections.length <= 0" type="danger" @click="deleteHandler()">{{ contents.btnAdAllFont == 1?'删除':'' }}<i class="el-icon-delete el-icon--right" /></el-button>
                        <el-button v-if="isAuth('shenqing','删除') && contents.btnAdAllIcon == 0 && contents.tableSelection" :disabled="dataListSelections.length <= 0" type="danger" @click="deleteHandler()">{{ contents.btnAdAllFont == 1?'删除':'' }}</el-button>

                        <el-button v-if="isAuth('shenqing','报表') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 1" type="warning" icon="el-icon-s-data" @click="chartDialog()">{{ contents.btnAdAllFont == 1?'统计报表':'' }}</el-button>
                        <el-button v-if="isAuth('shenqing','报表') && contents.btnAdAllIcon == 1 && contents.btnAdAllIconPosition == 2" type="warning" @click="chartDialog()">{{ contents.btnAdAllFont == 1?'统计报表':'' }}<i class="el-icon-s-data el-icon--right" /></el-button>
                        <el-button v-if="isAuth('shenqing','报表') && contents.btnAdAllIcon == 0" type="warning" @click="chartDialog()">{{ contents.btnAdAllFont == 1?'统计报表':'' }}</el-button>

                    </el-form-item>
                </el-row>
            </el-form>
            <div class="table-content">
                <el-table class="tables" :size="contents.tableSize" :show-header="contents.tableShowHeader"
                          :header-row-style="headerRowStyle" :header-cell-style="headerCellStyle"
                          :border="contents.tableBorder"
                          :fit="contents.tableFit"
                          :stripe="contents.tableStripe"
                          :row-style="rowStyle"
                          :cell-style="cellStyle"
                          :style="{width: '100%',fontSize:contents.tableContentFontSize,color:contents.tableContentFontColor}"
                          v-if="isAuth('shenqing','查看')"
                          :data="dataList"
                          v-loading="dataListLoading"
                          @selection-change="selectionChangeHandler">
                    <el-table-column  v-if="contents.tableSelection"
                                      type="selection"
                                      header-align="center"
                                      align="center"
                                      width="50">
                    </el-table-column>
                    <el-table-column label="索引" v-if="contents.tableIndex" type="index" width="50" />

                             <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign"
                                               prop="yhTypes"
                                               header-align="center"
                                               label="申请人">
                                 <template slot-scope="scope">
                                     {{scope.row.yhTypes}}
                                 </template>
                             </el-table-column>
                             <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign"
                                               prop="shenqingTime"
                                               header-align="center"
                                               label="申请时间">
                                 <template slot-scope="scope">
                                     {{scope.row.shenqingTime}}
                                 </template>
                             </el-table-column>
                             <el-table-column  :sortable="contents.tableSortable" :align="contents.tableAlign"
                                               prop="sfTypes"
                                               header-align="center"
                                               label="是否同意">
                                 <template slot-scope="scope">
                                     {{scope.row.sfTypes}}
                                 </template>
                             </el-table-column>
                    <el-table-column width="300" :align="contents.tableAlign"
                                     header-align="center"
                                     label="操作">
                        <template slot-scope="scope">

                            <el-button v-if="isAuth('shenqing','查看') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="success" icon="el-icon-tickets" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">{{ contents.tableBtnFont == 1?'详情':'' }}</el-button>
                            <el-button v-if="isAuth('shenqing','查看') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="success" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">{{ contents.tableBtnFont == 1?'详情':'' }}<i class="el-icon-tickets el-icon--right" /></el-button>
                            <el-button v-if="isAuth('shenqing','查看') && contents.tableBtnIcon == 0" type="success" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">{{ contents.tableBtnFont == 1?'详情':'' }}</el-button>

                            <el-button v-if="isAuth('shenqing','同意') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="primary" icon="el-icon-edit" size="mini" @click="consent(scope.row.id)">{{ contents.tableBtnFont == 1?'同意':'' }}</el-button>
                            <el-button v-if="isAuth('shenqing','同意') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="primary" size="mini" @click="consent(scope.row.id)">{{ contents.tableBtnFont == 1?'同意':'' }}<i class="el-icon-edit el-icon--right" /></el-button>
                            <el-button v-if="isAuth('shenqing','同意') && contents.tableBtnIcon == 0" type="primary" size="mini" @click="consent(scope.row.id)">{{ contents.tableBtnFont == 1?'同意':'' }}</el-button>

                            <el-button v-if="isAuth('shenqing','删除') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 1" type="danger" icon="el-icon-delete" size="mini" @click="deleteHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'删除':'' }}</el-button>
                            <el-button v-if="isAuth('shenqing','删除') && contents.tableBtnIcon == 1 && contents.tableBtnIconPosition == 2" type="danger" size="mini" @click="deleteHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'删除':'' }}<i class="el-icon-delete el-icon--right" /></el-button>
                            <el-button v-if="isAuth('shenqing','删除') && contents.tableBtnIcon == 0" type="danger" size="mini" @click="deleteHandler(scope.row.id)">{{ contents.tableBtnFont == 1?'删除':'' }}</el-button>


                        </template>
                    </el-table-column>
                </el-table>
                <el-pagination
                        clsss="pages"
                        :layout="layouts"
                        @size-change="sizeChangeHandle"
                        @current-change="currentChangeHandle"
                        :current-page="pageIndex"
                        :page-sizes="[10, 20, 50, 100]"
                        :page-size="Number(contents.pageEachNum)"
                        :total="totalPage"
                        :small="contents.pageStyle"
                        class="pagination-content"
                        :background="contents.pageBtnBG"
                        :style="{textAlign:contents.pagePosition==1?'left':contents.pagePosition==2?'center':'right'}"
                ></el-pagination>
            </div>
        </div>
        <!-- 添加/同意页面  将父组件的search方法传递给子组件-->
        <add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>

        <el-dialog
                title="统计报表"
                :visible.sync="chartVisiable"
                width="800">
            <div id="zhuangtaiChart" style="width:100%;height:600px;"></div>
            <span slot="footer" class="dialog-footer">
        <el-button @click="chartDialog">返回</el-button>
      </span>
        </el-dialog>

    </div>
</template>
<script>

    import AddOrUpdate from "./add-or-update";
    export default {
        data() {
            return {
                searchForm: {
                    key: ""
                },


                             yhTypesSelectSearch: [],
                             sfTypesSelectSearch: [],



                dataList: [],
                pageIndex: 1,
                pageSize: 10,
                totalPage: 0,
                dataListLoading: false,
                dataListSelections: [],
                showFlag: true,
                sfshVisiable: false,
                shForm: {},
                chartVisiable: false,
                addOrUpdateFlag:false,
                contents:{"searchBtnFontColor":"rgba(19, 20, 20, 1)","pagePosition":"1","inputFontSize":"14px","inputBorderRadius":"4px","tableBtnDelFontColor":"rgba(255, 73, 73, 1)","tableBtnIconPosition":"2","searchBtnHeight":"40px","inputIconColor":"#C0C4CC","searchBtnBorderRadius":"4px","tableStripe":true,"btnAdAllWarnFontColor":"rgba(30, 136, 229, 1)","tableBtnDelBgColor":"rgba(255, 255, 255, 1)","searchBtnIcon":"1","tableSize":"medium","searchBtnBorderStyle":"solid","tableSelection":true,"searchBtnBorderWidth":"1px","tableContentFontSize":"14px","searchBtnBgColor":"rgba(38, 198, 218, 1)","inputTitleSize":"14px","btnAdAllBorderColor":"#DCDFE6","pageJumper":true,"btnAdAllIconPosition":"1","searchBoxPosition":"1","tableBtnDetailFontColor":"rgba(38, 198, 218, 1)","tableBtnHeight":"40px","pagePager":true,"searchBtnBorderColor":"rgba(255, 255, 255, 1)","tableHeaderFontColor":"#909399","inputTitle":"1","tableBtnBorderRadius":"10px","btnAdAllFont":"1","btnAdAllDelFontColor":"rgba(255, 73, 73, 1)","tableBtnIcon":"1","btnAdAllHeight":"40px","btnAdAllWarnBgColor":"rgba(255, 255, 255, 1)","btnAdAllBorderWidth":"1px","tableStripeFontColor":"#606266","tableBtnBorderStyle":"solid","inputHeight":"40px","btnAdAllBorderRadius":"4px","btnAdAllDelBgColor":"rgba(255, 255, 255, 1)","pagePrevNext":true,"btnAdAllAddBgColor":"rgba(255, 255, 255, 1)","searchBtnFont":"1","tableIndex":true,"btnAdAllIcon":"1","tableSortable":false,"pageSizes":true,"tableFit":true,"pageBtnBG":true,"searchBtnFontSize":"14px","tableBtnEditBgColor":"rgba(255, 255, 255, 1)","inputBorderWidth":"1px","inputFontPosition":"1","inputFontColor":"#333","pageEachNum":10,"tableHeaderBgColor":"#fff","inputTitleColor":"#333","btnAdAllBoxPosition":"1","tableBtnDetailBgColor":"rgba(255, 255, 255, 1)","inputIcon":"1","searchBtnIconPosition":"1","btnAdAllFontSize":"14px","inputBorderStyle":"solid","inputBgColor":"#fff","pageStyle":false,"pageTotal":true,"btnAdAllAddFontColor":"rgba(38, 198, 218, 1)","tableBtnFont":"1","tableContentFontColor":"#606266","inputBorderColor":"#DCDFE6","tableShowHeader":true,"tableBtnFontSize":"10px","tableBtnBorderColor":"#DCDFE6","inputIconPosition":"1","tableBorder":true,"btnAdAllBorderStyle":"solid","tableBtnBorderWidth":"1px","tableStripeBgColor":"#F5F7FA","tableBtnEditFontColor":"rgba(30, 136, 229, 1)","tableAlign":"center"},
                layouts: "",


            };
        },
        created() {
            this.init();
            this.getDataList();
            this.contentStyleChange()
        },
        mounted() {

        },
        filters: {
            htmlfilter: function (val) {
                return val.replace(/<[^>]*>/g).replace(/undefined/g,"");
            }
        },
        components: {
            AddOrUpdate,
        },
        methods: {
            contentStyleChange() {
                this.contentSearchStyleChange()
                this.contentBtnAdAllStyleChange()
                this.contentSearchBtnStyleChange()
                this.contentTableBtnStyleChange()
                this.contentPageStyleChange()
            },
            contentSearchStyleChange() {
                this.$nextTick(()=>{
                    document.querySelectorAll(".form-content .slt .el-input__inner").forEach(el=>{
                    let textAlign = "left"
                    if(this.contents.inputFontPosition == 2) textAlign = "center"
                if(this.contents.inputFontPosition == 3) textAlign = "right"
                el.style.textAlign = textAlign
                el.style.height = this.contents.inputHeight
                el.style.lineHeight = this.contents.inputHeight
                el.style.color = this.contents.inputFontColor
                el.style.fontSize = this.contents.inputFontSize
                el.style.borderWidth = this.contents.inputBorderWidth
                el.style.borderStyle = this.contents.inputBorderStyle
                el.style.borderColor = this.contents.inputBorderColor
                el.style.borderRadius = this.contents.inputBorderRadius
                el.style.backgroundColor = this.contents.inputBgColor
            })
            if(this.contents.inputTitle) {
                    document.querySelectorAll(".form-content .slt .el-form-item__label").forEach(el=>{
                        el.style.color = this.contents.inputTitleColor
                    el.style.fontSize = this.contents.inputTitleSize
                    el.style.lineHeight = this.contents.inputHeight
                })
                }
                setTimeout(()=>{
                    document.querySelectorAll(".form-content .slt .el-input__prefix").forEach(el=>{
                    el.style.color = this.contents.inputIconColor
                el.style.lineHeight = this.contents.inputHeight
            })
                document.querySelectorAll(".form-content .slt .el-input__suffix").forEach(el=>{
                    el.style.color = this.contents.inputIconColor
                el.style.lineHeight = this.contents.inputHeight
            })
                document.querySelectorAll(".form-content .slt .el-input__icon").forEach(el=>{
                    el.style.lineHeight = this.contents.inputHeight
            })
            },10)

            })
            },
             // 搜索按钮
            contentSearchBtnStyleChange() {
                this.$nextTick(()=>{
                    document.querySelectorAll(".form-content .slt .el-button--success").forEach(el=>{
                    el.style.height = this.contents.searchBtnHeight
                el.style.color = this.contents.searchBtnFontColor
                el.style.fontSize = this.contents.searchBtnFontSize
                el.style.borderWidth = this.contents.searchBtnBorderWidth
                el.style.borderStyle = this.contents.searchBtnBorderStyle
                el.style.borderColor = this.contents.searchBtnBorderColor
                el.style.borderRadius = this.contents.searchBtnBorderRadius
                el.style.backgroundColor = this.contents.searchBtnBgColor
            })
            })
            },
            // 新增、批量删除
            contentBtnAdAllStyleChange() {
                this.$nextTick(()=>{
                    document.querySelectorAll(".form-content .ad .el-button--success").forEach(el=>{
                    el.style.height = this.contents.btnAdAllHeight
                el.style.color = this.contents.btnAdAllAddFontColor
                el.style.fontSize = this.contents.btnAdAllFontSize
                el.style.borderWidth = this.contents.btnAdAllBorderWidth
                el.style.borderStyle = this.contents.btnAdAllBorderStyle
                el.style.borderColor = this.contents.btnAdAllBorderColor
                el.style.borderRadius = this.contents.btnAdAllBorderRadius
                el.style.backgroundColor = this.contents.btnAdAllAddBgColor
            })
                document.querySelectorAll(".form-content .ad .el-button--danger").forEach(el=>{
                    el.style.height = this.contents.btnAdAllHeight
                el.style.color = this.contents.btnAdAllDelFontColor
                el.style.fontSize = this.contents.btnAdAllFontSize
                el.style.borderWidth = this.contents.btnAdAllBorderWidth
                el.style.borderStyle = this.contents.btnAdAllBorderStyle
                el.style.borderColor = this.contents.btnAdAllBorderColor
                el.style.borderRadius = this.contents.btnAdAllBorderRadius
                el.style.backgroundColor = this.contents.btnAdAllDelBgColor
            })
                document.querySelectorAll(".form-content .ad .el-button--warning").forEach(el=>{
                    el.style.height = this.contents.btnAdAllHeight
                el.style.color = this.contents.btnAdAllWarnFontColor
                el.style.fontSize = this.contents.btnAdAllFontSize
                el.style.borderWidth = this.contents.btnAdAllBorderWidth
                el.style.borderStyle = this.contents.btnAdAllBorderStyle
                el.style.borderColor = this.contents.btnAdAllBorderColor
                el.style.borderRadius = this.contents.btnAdAllBorderRadius
                el.style.backgroundColor = this.contents.btnAdAllWarnBgColor
            })
            })
            },
            // 表格
            rowStyle({ row, rowIndex}) {
                if (rowIndex % 2 == 1) {
                    if(this.contents.tableStripe) {
                        return {color:this.contents.tableStripeFontColor}
                    }
                } else {
                    return ""
                }
            },
            cellStyle({ row, rowIndex}){
                if (rowIndex % 2 == 1) {
                    if(this.contents.tableStripe) {
                        return {backgroundColor:this.contents.tableStripeBgColor}
                    }
                } else {
                    return ""
                }
            },
            headerRowStyle({ row, rowIndex}){
                return {color: this.contents.tableHeaderFontColor}
            },
            headerCellStyle({ row, rowIndex}){
                return {backgroundColor: this.contents.tableHeaderBgColor}
            },
            // 表格按钮
            contentTableBtnStyleChange(){

            },
            // 分页
            contentPageStyleChange(){
                let arr = []

                if(this.contents.pageTotal) arr.push("total")
                if(this.contents.pageSizes) arr.push("sizes")
                if(this.contents.pagePrevNext){
                    arr.push("prev")
                    if(this.contents.pagePager) arr.push("pager")
                    arr.push("next")
                }
                if(this.contents.pageJumper) arr.push("jumper")
                this.layouts = arr.join()
                this.contents.pageEachNum = 10
            },
            chartDialog() {
                this.chartVisiable = !this.chartVisiable;
                this.$nextTick(()=>{
                    var zhuangtaiChart = this.$echarts.init(document.getElementById("zhuangtaiChart"),'macarons');
                this.$http({
                    url: "group/表名/字段",
                    method: "get",
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                    let res = data.data;
                    let xAxis = [];
                    let yAxis = [];
                    let pArray = []
                    for(let i=0;i<res.length;i++){
                        xAxis.push(res[i].zhuangtai);
                        yAxis.push(res[i].total);
                        pArray.push({
                            value: res[i].total,
                            name: res[i].zhuangtai
                        })
                        var option = {};
                        option = {
                            title: {
                                text: '学生',
                                left: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: '{b} : {c} ({d}%)'
                            },
                            series: [
                                {
                                    type: 'pie',
                                    radius: '55%',
                                    center: ['50%', '60%'],
                                    data: pArray,
                                    emphasis: {
                                        itemStyle: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        zhuangtaiChart.setOption(option);
                        //根据窗口的大小变动图表
                        window.onresize = function() {
                            zhuangtaiChart.resize();
                        };
                    }
                }
            });
                // xcolumn ycolumn
            })
            },
            init () {
            },
            search() {
                this.pageIndex = 1;
                this.getDataList();
            },
            selectUpdate(){
                var bbb = this.dataList;
                var select= {};
                              var yhTypesSelect = this.yhTypesSelectSearch;
                    for(var i=0 ; i< yhTypesSelect.length ; i++){
                        select[ yhTypesSelect[i].id] =  yhTypesSelect[i].xingming;
                    }
                    for(var i=0 ; i<bbb.length ; i++){
                        bbb[i].yhTypes = select[bbb[i].yhTypes];
                    }
                    select = {};


                              var sfTypesSelect = this.sfTypesSelectSearch;
                    for(var i=0 ; i< sfTypesSelect.length ; i++){
                        select[ sfTypesSelect[i].codeIndex] =  sfTypesSelect[i].indexName;
                    }
                    for(var i=0 ; i<bbb.length ; i++){
                        bbb[i].sfTypes = select[bbb[i].sfTypes];
                    }
                    select = {};


            },
            // 获取数据列表
            getDataList() {
                this.dataListLoading = true;
                let params = {
                    page: this.pageIndex,
                    limit: this.pageSize,
                }
                                                                                    
                    this.$http({
                        url: `yonghu/page?page=1&limit=100&sort=&order=&dicCode=yh_types`,async:false,
                        method: "get"
                    }).then(({data}) => {
                        if (data && data.code === 0) {
                            this.yhTypesSelectSearch = data.data.list;
                        } else {
                            this.$message.error(data.msg);
                        }
                    });
                    this.$http({
                        url: `dictionary/page?page=1&limit=100&sort=&order=&dicCode=sf_types`,
						async:false,
                        method: "get"
                    }).then(({data}) => {
                        if (data && data.code === 0) {
                            this.sfTypesSelectSearch = data.data.list;
                        } else {
                            this.$message.error(data.msg);
                        }
                    });
                this.$http({
                    url: "shenqing/page",async:false,
                    method: "get",
                    params: params
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                    this.dataList = data.data.list;
                    this.totalPage = data.data.total;
                             this.selectUpdate();

                } else {
                    this.dataList = [];
                    this.totalPage = 0;
                }
                this.dataListLoading = false;
            });


            },


            // 每页数
            sizeChangeHandle(val) {
                this.pageSize = val;
                this.pageIndex = 1;
                this.getDataList();
            },
            // 当前页
            currentChangeHandle(val) {
                this.pageIndex = val;
                this.getDataList();
            },
            // 多选
            selectionChangeHandler(val) {
                this.dataListSelections = val;
            },
            // 添加/同意
            addOrUpdateHandler(id,type) {
                this.showFlag = false;
                this.addOrUpdateFlag = true;
                this.crossAddOrUpdateFlag = false;
                if(type!='info'){
                    type = 'else';
                }
                this.$nextTick(() => {
                    this.$refs.addOrUpdate.init(id,type);
            });
            },
            // 查看评论
            // 下载
            download(file){
                window.open(`${file}`)
            },
            // 删除
            deleteHandler(id) {
                var ids = id
                        ? [Number(id)]
                        : this.dataListSelections.map(item => {
                    return Number(item.id);
            });
                this.$confirm(`确定进行[ ${id ? '删除' : '批量删除'}]操作?`, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.$http({



                    url: "shenqing/delete",

                     method: "post",
                    data: ids
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                    this.$message({
                        message: "操作成功",
                        type: "success",
                        duration: 1500,
                        onClose: () => {
                        this.search();
                }
                });
                } else {
                    this.$message.error(data.msg);
                }
            });
            });
            },
			consent(id) {
                this.$confirm(`确定要同意这个申请吗?`, '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.$http({
                    url: "shenqing/consent?ids="+id,
                     method: "get",
                }).then(({ data }) => {
                    if (data && data.code === 0) {
                    this.$message({
                        message: "操作成功",
                        type: "success",
                        duration: 1500,
                        onClose: () => {
                        this.search();
                }
                });
                } else {
                    this.$message.error(data.msg);
                }
            });
            });
            },
			
			
        }

    };


</script>
<style lang="scss" scoped>
    .slt {
        margin: 0 !important;
        display: flex;
    }

    .ad {
        margin: 0 !important;
        display: flex;
    }

    .pages {
    & ::v-deep el-pagination__sizes{
    & ::v-deep el-input__inner {
          height: 22px;
          line-height: 22px;
      }
    }
    }


    .el-button+.el-button {
        margin:0;
    }

    .tables {
    & ::v-deep .el-button--success {
          height: 40px;
          color: rgba(38, 198, 218, 1);
          font-size: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: #DCDFE6;
          border-radius: 10px;
          background-color: rgba(255, 255, 255, 1);
      }

    & ::v-deep .el-button--primary {
          height: 40px;
          color: rgba(30, 136, 229, 1);
          font-size: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: #DCDFE6;
          border-radius: 10px;
          background-color: rgba(255, 255, 255, 1);
      }

    & ::v-deep .el-button--danger {
          height: 40px;
          color: rgba(255, 73, 73, 1);
          font-size: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: #DCDFE6;
          border-radius: 10px;
          background-color: rgba(255, 255, 255, 1);
      }

    & ::v-deep .el-button {
          margin: 4px;
      }
    }

</style>
