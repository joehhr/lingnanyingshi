const base = {
    get() {
                return {
            url : "http://localhost:8080/lingnanyingshiwenhua/",
            name: "lingnanyingshiwenhua",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/lingnanyingshiwenhua/front/index.html'
        };
            },
    getProjectName(){
        return {
            projectName: "岭南饮食文化交流网站"
        } 
    }
}
export default base
