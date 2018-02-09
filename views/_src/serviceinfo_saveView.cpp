#include <QtCore>
#include <TreeFrogView>
#include "serviceinfo.h" 
#include "applicationhelper.h"
#include "curlhelper.h"
#include "xmlhelper.h"

class T_VIEW_EXPORT serviceinfo_saveView : public TActionView
{
  Q_OBJECT
public:
  serviceinfo_saveView() : TActionView() { }
  QString toString();
};

QString serviceinfo_saveView::toString()
{
  responsebody.reserve(2386);
  responsebody += QLatin1String("<!DOCTYPE html>\n");
    tfetch(QVariantMap, serviceInfo);
  responsebody += QLatin1String("<html>\n<head>\n  <meta charset=\"UTF-8\">\n  <title>");
  responsebody += THttpUtility::htmlEscape(controller()->name() + ": " + controller()->activeAction());
  responsebody += QLatin1String("</title>\n</head>\n<body>\n<p style=\"color: red\">");
  tehex(error);
  responsebody += QLatin1String("</p>\n<p style=\"color: green\">");
  tehex(notice);
  responsebody += QLatin1String("</p>\n\n<h1>Editing Service Info</h1>\n\n");
  responsebody += QVariant(formTag(urla("save", serviceInfo["id"]), Tf::Post)).toString();
  responsebody += QLatin1String("\n  <p>\n    <label>ID<br /><input type=\"text\" name=\"serviceInfo[id]\" value=\"");
  responsebody += THttpUtility::htmlEscape(serviceInfo["id"]);
  responsebody += QLatin1String("\" readonly=\"readonly\" /></label>\n  </p>\n  <p>\n    <label>V ID<br /><input type=\"text\" name=\"serviceInfo[vId]\" value=\"");
  responsebody += THttpUtility::htmlEscape(serviceInfo["vId"]);
  responsebody += QLatin1String("\" /></label>\n  </p>\n  <p>\n    <label>Service Name<br /><input type=\"text\" name=\"serviceInfo[serviceName]\" value=\"");
  responsebody += THttpUtility::htmlEscape(serviceInfo["serviceName"]);
  responsebody += QLatin1String("\" /></label>\n  </p>\n  <p>\n    <label>Required Privacy Standard<br /><input type=\"text\" name=\"serviceInfo[requiredPrivacyStandard]\" value=\"");
  responsebody += THttpUtility::htmlEscape(serviceInfo["requiredPrivacyStandard"]);
  responsebody += QLatin1String("\" /></label>\n  </p>\n  <p>\n    <label>Data Type<br /><input type=\"text\" name=\"serviceInfo[dataType]\" value=\"");
  responsebody += THttpUtility::htmlEscape(serviceInfo["dataType"]);
  responsebody += QLatin1String("\" /></label>\n  </p>\n  <p>\n    <label>Interval<br /><input type=\"text\" name=\"serviceInfo[interval]\" value=\"");
  responsebody += THttpUtility::htmlEscape(serviceInfo["interval"]);
  responsebody += QLatin1String("\" /></label>\n  </p>\n  <p>\n    <input type=\"submit\" value=\"Save\" />\n  </p>\n</form>\n\n");
  responsebody += QVariant(linkTo("Show", urla("show", serviceInfo["id"]))).toString();
  responsebody += QLatin1String(" |\n");
  responsebody += QVariant(linkTo("Back", urla("index"))).toString();
  responsebody += QLatin1String("\n</body>\n</html>\n");

  return responsebody;
}

T_DEFINE_VIEW(serviceinfo_saveView)

#include "serviceinfo_saveView.moc"
