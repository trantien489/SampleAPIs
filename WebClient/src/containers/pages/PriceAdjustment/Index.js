import React, { Component } from "react";
import { connect } from 'react-redux';
import { translate } from 'react-i18next';
import key from '../../../i18n/key';
import { Col, Row } from "reactstrap";
import LoadingOverlay from 'react-loading-overlay';
import { ErrorAlert } from '../../../components/alerts/errorAlert';
import { hasRecordsActionReducer, applyCheckAuthorized } from '../../../utilities/validate';
import { getAllPriceAdjustmentAction, changeStatusPriceAdjustmentAction, deletePriceAdjustmentAction} from '../../../actions/priceAdjustment';
import { GridView } from '../../../components/gridView/gridView';
import { PRICEADJUSTMENT } from "../../../actionTypes/priceAdjustment";
import { addAction, isExistAction, removeAction } from '../../../utilities/currrentActionHelper';

class PriceAdjustment extends Component {
    constructor(props) {
        super(props);
        applyCheckAuthorized();
        this.state = {
            currentAction: [],
        };
    }
    componentDidMount() {
        //Sau khi render hàm này sẽ chạy
        this.props.getAllAction();
    }
    requestAction = (nextProps) => {
        //Khi có action phát đi thì hàm này sẽ handle
        let {  getAllModel } = nextProps;
        const { currentAction } = this.state;
        let result = false;

        if (getAllModel.isLoading && !isExistAction(currentAction, PRICEADJUSTMENT.FILTER)) {
            addAction(currentAction, PRICEADJUSTMENT.FILTER)
            result = true;
        }
        return result;
    }
    responseAction = (nextProps) => {
        //Khi api trả dữ liệu về thì hàm này sẽ handle
        const { getAllModel } = nextProps;
        const { currentAction } = this.state;
        if (!getAllModel.isLoading && isExistAction(currentAction, PRICEADJUSTMENT.FILTER)) {
            this.setState({
                currentAction: removeAction(currentAction, PRICEADJUSTMENT.FILTER)
            });
        }
    }
    componentWillReceiveProps(nextProps) {
        //request action
        if (this.requestAction(nextProps)) return;
        //response action
        this.responseAction(nextProps);
    }
  
    render() {
        const { t, changeStatusModel, deleteModel, getAllModel } = this.props;
        let disableColumns = ['CompanyId','CapacityId','UpPrice', 'DownPrice'];//['Id','Status'];
        if (!getAllModel || !changeStatusModel || !deleteModel) return;
        const isLoadingOver = changeStatusModel.isLoading || deleteModel.isLoading;
        if (getAllModel.isLoading) {
            return <LoadingOverlay active spinner text={t(key.common.loadingSpinner)} className="overlayFullScreen"/>
        } else if (getAllModel.isError) {
            return <ErrorAlert responseData={getAllModel.responseData}
                msgErrorGetAPI={t(key.common.errorGetAllAPI)} t={this.props.t}
                msgRedirectToLogin={t(key.common.redirectToLogin)} />
        } else {
            if (hasRecordsActionReducer(getAllModel)) {
                return <GridView
                    isLoadingOver={isLoadingOver}
                    records={getAllModel.responseData.Data.Records}
                    keyFields={key.priceAdjustment}
                    tableName="PRICEADJUSTMENT"
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
    getAllModel: state.getAllPriceAdjustmentReducer,
    changeStatusModel: state.changeStatusPriceAdjustmentReducer,
    deleteModel: state.deletePriceAdjustmentReducer
});
//Phát đi tính hiệu thông qua action (để lấy data từ api)
const mapDispatchToProps = {
    getAllAction: getAllPriceAdjustmentAction,
    changeStatusAction: changeStatusPriceAdjustmentAction,
    deleteAction: deletePriceAdjustmentAction,
};
export default translate()(connect(mapStateToProps, mapDispatchToProps)(PriceAdjustment));