import React, { Component } from "react";
import { connect } from 'react-redux';
import { translate } from 'react-i18next';
import LoadingOverlay from 'react-loading-overlay';
import ErrorAlert from '../../../components/alerts/errorAlert';
import key from '../../../i18n/key';
import { hasRecordsActionReducer, applyCheckAuthorized } from '../../../utilities/validate';
import { GridView } from '../../../components/gridView/gridView';
import { Col, Row } from "reactstrap";
import { getAllCompanyAction, changeStatusCompanyAction, deleteCompanyAction} from '../../../actions/company';
class Company extends Component{
    constructor(props) {
        super(props);
        applyCheckAuthorized();
    }
    componentDidMount() {
        //Sau khi render hàm này sẽ chạy
        this.props.getAllAction();
    }
    requestAction = (nextProps) => {
        //Khi có action phát đi thì hàm này sẽ handle
    }
    responseAction = (nextProps) => {
        //Khi api trả dữ liệu về thì hàm này sẽ handle
    }
    componentWillReceiveProps(nextProps) {
        //request action
        if (this.requestAction(nextProps)) return;
        //response action
        this.responseAction(nextProps);
    }
    render() {
        const { t, changeStatusModel, deleteModel, getAllModel } = this.props;
        let disableColumns = ['Logo','Hotline','Fax','Map','LanguageId','LanguageName'];
        if (!getAllModel || !changeStatusModel || !deleteModel) return;
        const isLoadingOver = changeStatusModel.isLoading || deleteModel.isLoading;
        if (getAllModel.isLoading) {
            return <LoadingOverlay active spinner text={t(key.common.loadingSpinner)} />
        } else if (getAllModel.isError) {
            return <ErrorAlert responseData={getAllModel.responseData}
                msgErrorGetAPI={t(key.common.errorGetAllAPI)} t={this.props.t}
                msgRedirectToLogin={t(key.common.redirectToLogin)} />
        } else {
            if (hasRecordsActionReducer(getAllModel)) {
                return <GridView
                    isLoadingOver={isLoadingOver}
                    records={getAllModel.responseData.Data.Records}
                    keyFields={key.company}
                    tableName="COMPANY"
                    disableColumns={disableColumns}
                    {...this.props}
                />
            } else {
                return <div className="animated fadeIn"><Row><Col xs="12" lg="12">{t(key.common.noDataFound)}</Col></Row></div>;
            }
        }
    }
}
//Nhận dữ liệu trả về từ reducer (reducer thì lấy data từ api)
const mapStateToProps = state => ({
    getAllModel: state.getAllCompanyReducer,
    changeStatusModel: state.changeStatusCompanyReducer,
    deleteModel: state.deleteCompanyReducer,
});
//Phát đi tính hiệu thông qua action (để lấy data từ api)
const mapDispatchToProps = {
    getAllAction: getAllCompanyAction,
    changeStatusAction: changeStatusCompanyAction,
    deleteAction: deleteCompanyAction,
};
export default translate()(connect(mapStateToProps, mapDispatchToProps)(Company));